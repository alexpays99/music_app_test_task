import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_test_task/feature/home/data/models/track_list_state_model.dart';
import 'package:music_app_test_task/core/injector.dart' as di;
import 'package:music_app_test_task/feature/home/presentation/cubit/tracks_cubit.dart';
import 'package:music_app_test_task/utils/ext.dart';

import '../../favourite/data/models/favourite_track_model.dart';
import '../domain/entities/artist_base_info_entity.dart';
import 'widgets/add_to_favourite_button.dart';

class ArtistInfoPage extends StatefulWidget {
  const ArtistInfoPage({super.key, required this.artist});

  final ArtistBaseInfoEntity artist;

  @override
  State<ArtistInfoPage> createState() => _ArtistInfoPageState();
}

class _ArtistInfoPageState extends State<ArtistInfoPage> {
  late TracksCubit cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cubit = di.getIt<TracksCubit>()
      ..fetchArtistTrackList(widget.artist.tracklist);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.artist.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.artist.pictureBig,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Text("${widget.artist.name}'s tracks:"),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            BlocBuilder<TracksCubit, TracksState>(
              builder: (context, state) {
                final trackList = state.trackListStateModel;
                return switch (trackList?.trackListState) {
                  TrackListState.initial => const SizedBox.shrink(),
                  TrackListState.loading => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  TrackListState.loaded => ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: trackList?.trackListData?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final title = trackList
                            ?.trackListData?[index].titleShort
                            .toString();
                        final duration = trackList?.trackListData?[index]
                            .duration?.toMinutesRepresentation;
                        final albumImage =
                            trackList?.trackListData?[index].album?.coverMedium;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                      imageUrl: albumImage!,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.12,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.12,
                                    ),
                                  ),
                                  title: Text(
                                    title!.contains('(')
                                        ? title.substring(0, title.indexOf('('))
                                        : title,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  subtitle: Text(duration ?? ''),
                                  trailing: AddToFavouriteButton(
                                    track: FavouriteTrackModel
                                        .fromRemoteTrackModel(
                                      trackList!.trackListData![index],
                                    ),
                                    index: index,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  TrackListState.error => Center(
                      child: Text(trackList?.message ?? ''),
                    ),
                  null => const SizedBox.shrink(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

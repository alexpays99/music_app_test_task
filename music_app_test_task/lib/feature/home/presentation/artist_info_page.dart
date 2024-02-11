import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_test_task/feature/home/data/models/track_list_state_model.dart';
import 'package:music_app_test_task/core/injector.dart' as di;
import 'package:music_app_test_task/feature/home/presentation/cubit/tracks_cubit.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/ui_constants.dart';
import '../domain/entities/artist_base_info_entity.dart';

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
                        final id =
                            trackList?.trackListData?[index].id.toString();
                        final title =
                            trackList?.trackListData?[index].title.toString();
                        final duration = trackList?.trackListData?[index]
                            .duration?.toMinutesRepresentation;
                        return ListTile(
                          leading: Text(
                            id ?? '',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          title: Text(
                            title ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          subtitle: Text(duration ?? ''),
                          trailing: IconButton(
                            onPressed: () {
                              // setState(() {
                              //   _isFavourite = !_isFavourite;
                              // });
                              // final recipeModel =
                              //     RecipeModel.fromUserEntity(widget.recipe);
                              // if (_isFavourite) {
                              //   getIt
                              //       .get<AddRecipeToFavouriteProvider>()
                              //       .call(recipeModel);
                              // } else {
                              //   getIt
                              //       .get<DeleteRecipeFromFavouriteProvider>()
                              //       .call(widget.index);
                              // }
                            },
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: AppColors.unselectedRecipeColor,
                              size: UIConstants.addToFavouriteIconSize,
                              // _isFavourite
                              //     ? Icons.favorite
                              //     : Icons.favorite_outline,
                              // color: _isFavourite
                              //     ? AppColors.selectedRecipeColor
                              //     : AppColors.unselectedRecipeColor,
                              // size: UIConstants.addToFavouriteIconSize,
                            ),
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

extension IntExtension on int {
  // This getter returns a string representation of minutes from seconds
  String get toMinutesRepresentation {
    // Divide the int value by 60 and round down to get the minutes
    int minutes = this ~/ 60;
    // Get the remaining seconds by using the modulo operator
    int remainingSeconds = this % 60;
    // Add a leading zero to the seconds if they are less than 10
    String secondsString =
        remainingSeconds < 10 ? "0$remainingSeconds" : "$remainingSeconds";
    // Return the formatted string with minutes and seconds
    return "$minutes:$secondsString minutes";
  }
}

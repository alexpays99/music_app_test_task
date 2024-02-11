import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:music_app_test_task/core/injector.dart' as di;

import '../data/models/artist_list_state_model.dart';
import '../domain/entities/artist_base_info_entity.dart';

class ArtistInfoPage extends StatefulWidget {
  const ArtistInfoPage({super.key, required this.artist});

  final ArtistBaseInfoEntity artist;

  @override
  State<ArtistInfoPage> createState() => _ArtistInfoPageState();
}

class _ArtistInfoPageState extends State<ArtistInfoPage> {
  late ArtistCubit cubit;

  @override
  void initState() {
    super.initState();
    // cubit = di.getIt<ArtistCubit>()
    //   ..fetchArtistTrackList(widget.artist.tracklist!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.artist.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.artist.pictureBig ?? '',
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Text("${widget.artist.name}'s tracks:"),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            BlocBuilder<ArtistCubit, ArtistState>(
              builder: (context, state) {
                final trackList = state.artistListStateModel;
                return switch (trackList?.trackListState) {
                  TrackListState.initial => const SizedBox.shrink(),
                  TrackListState.loading => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  TrackListState.loaded => const SizedBox.shrink(),
                  // ListView.builder(
                  //     itemCount: trackList?.value?.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ListTile(
                  //         leading: Text(
                  //             trackList?.trackListData?[index].id.toString() ??
                  //                 ''),
                  //         title: Text(
                  //             trackList?.trackListData?[index].title ?? ''),
                  //       );
                  //     },
                  //   ),
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

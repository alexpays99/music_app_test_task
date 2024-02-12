import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/injector.dart';
import '../../../../utils/box_names.dart';
import '../../../../utils/ui_constants.dart';
import '../../data/models/favourite_track_list_state_model.dart';
import '../../data/models/favourite_track_model.dart';
import '../cubit/favourite_tracks_list_cubit.dart';
import 'favourite_track_widget.dart';

class FavouriteTracksList extends StatelessWidget {
  const FavouriteTracksList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<FavouriteTracksListCubit>();
    return BlocBuilder<FavouriteTracksListCubit, FavouriteTracksListState>(
      builder: (context, state) {
        final favouriteList = state.favouriteTrackListStateModel;
        final box = Hive.box(BoxName.tracks);

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIConstants.myRecipesListPadding,
          ),
          child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, box, child) {
              final tracks =
                  box.values.map((e) => e as FavouriteTrackModel).toList();

              // Sort the tracks by artist name and track name
              tracks.sort((a, b) {
                // Compare the artist name of each track
                final artistCompare =
                    a.artistName?.compareTo('${b.artistName}') ?? 0;
                // If the artist name is the same, compare the track name
                if (artistCompare == 0) {
                  return a.title!.compareTo(b.title!);
                }
                // Otherwise, return the artist name comparison result
                return artistCompare;
              });
              print('TRACKS: $tracks');

              return ListView.builder(
                itemCount: tracks.length,
                itemBuilder: (context, index) {
                  final track = tracks[index];
                  final trackId = track.id!;

                  return FavouriteTrackWidget(
                    track: track,
                    index: index,
                    onPress: () {
                      cubit.deleteTrackFromFavourite(trackId);
                      tracks.removeAt(index);
                    },
                  );
                },
              );
            },
          ),
        );

        // return switch (favouriteList?.trackListState) {
        //   FavouriteTrackListState.initial => const SizedBox.shrink(),
        //   FavouriteTrackListState.loading => const Center(
        //       child: CupertinoActivityIndicator(color: Colors.white),
        //     ),
        //   FavouriteTrackListState.loaded => Padding(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: UIConstants.myRecipesListPadding,
        //       ),
        //       child: ValueListenableBuilder(
        //         valueListenable: box.listenable(),
        //         builder: (context, box, child) {
        //           final tracks = box.values
        //               .map((e) => FavouriteTrackModel.fromHiveDatabase(e))
        //               .toList();

        //           // Sort the tracks by artist name and track name
        //           tracks.sort((a, b) {
        //             // Compare the artist name of each track
        //             final artistCompare =
        //                 a.artistName?.compareTo('${b.artistName}') ?? 0;
        //             // If the artist name is the same, compare the track name
        //             if (artistCompare == 0) {
        //               return a.title!.compareTo(b.title!);
        //             }
        //             // Otherwise, return the artist name comparison result
        //             return artistCompare;
        //           });
        //           print('TRACKS: $tracks');

        //           return ListView.builder(
        //             itemCount: tracks.length,
        //             itemBuilder: (context, index) {
        //               final track =
        //                   FavouriteTrackModel.fromHiveDatabase(tracks[index]);
        //               final trackId = track.id!;

        //               // final savedTrack = box.getAt(index);
        //               // final trackId =
        //               //     FavouriteTrackModel.fromHiveDatabase(savedTrack).id!;
        //               return ListTile(
        //                 leading: Text('${track.artistName}'),
        //               );
        //               // FavouriteTrackWidget(
        //               //   track: track,
        //               //   index: index,
        //               //   onPress: () {
        //               //     cubit.deleteTrackFromFavourite(trackId);
        //               //   },
        //               // );
        //             },
        //           );
        //         },
        //       ),
        //     ),
        //   FavouriteTrackListState.error => Center(
        //       child: Text('${favouriteList?.message}'),
        //     ),
        //   null => const SizedBox.shrink(),
        // };
      },
    );
  }
}

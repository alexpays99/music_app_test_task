import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/injector.dart';
import '../../../../utils/box_names.dart';
import '../../../../utils/ui_constants.dart';
import '../../data/models/favourite_track_model.dart';
import '../cubit/favourite_tracks_list_cubit.dart';
import 'favourite_track_widget.dart';

class FavouriteTracksList extends StatefulWidget {
  const FavouriteTracksList({super.key});

  @override
  State<FavouriteTracksList> createState() => _FavouriteTracksListState();
}

class _FavouriteTracksListState extends State<FavouriteTracksList> {
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<FavouriteTracksListCubit>();
    return BlocBuilder<FavouriteTracksListCubit, FavouriteTracksListState>(
      builder: (context, state) {
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
              tracks.sort((a, b) {
                final artistCompare =
                    a.artistName?.compareTo('${b.artistName}') ?? 0;
                if (artistCompare == 0) {
                  return a.title!.compareTo(b.title!);
                }
                return artistCompare;
              });
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
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

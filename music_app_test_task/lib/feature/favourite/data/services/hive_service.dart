import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:music_app_test_task/core/domain/entities/failure.dart';

import '../../../../utils/box_names.dart';
import '../models/favourite_track_model.dart';

class HiveService {
  final logger = Logger();

  ValueListenable<Box>? getBoxListenable() {
    try {
      Hive.openBox(BoxName.tracks).then((_) {
        final box = Hive.box(BoxName.tracks);
        final valueNotifier = ValueNotifier<Box>(box);
        return valueNotifier;
      });
    } catch (e) {
      logger.d(e);
    }
    return null;
  }

  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox() async {
    try {
      final box = await Hive.openBox(BoxName.tracks);
      final trackList = box.values.map((e) {
        return e as FavouriteTrackModel;
      }).toList();
      logger.d(
        'Amount of tracks in Box:${trackList.length};\nTrack List From Box: $trackList',
      );
      return right(trackList);
    } catch (e) {
      logger.d(e);
      return left(throw Exception(e));
    }
  }

  Future<void> insert(FavouriteTrackModel track) async {
    final box = await Hive.openBox(BoxName.tracks);
    box.add(track);
    final trackBox = await Hive.openBox(BoxName.tracks);
    for (var track in trackBox.values) {
      logger.d(track.toString());
    }
  }

  // Future<void> delete(int trackId) async {
  //   final box = await Hive.openBox(BoxName.tracks);
  //   box.deleteAt(trackId);
  //   final trackList = box.values.map((e) {
  //     return e as FavouriteTrackModel;
  //   }).toList();
  //   logger.d('Amount of tracks in Box:${trackList.length}');
  // }

  Future<void> delete(int trackId) async {
    final box = await Hive.openBox(BoxName.tracks);
    // Declare a variable to store the found key
    dynamic keyToDelete;
    // Iterate over the box values
    for (var key in box.keys) {
      // Get the track model from the box
      final track = box.get(key) as FavouriteTrackModel;
      // Compare the track id with the given id
      if (track.id == trackId) {
        // If they match, assign the key to the variable
        keyToDelete = key;
        // Break the loop
        break;
      }
    }
    // Delete the key from the box
    box.delete(keyToDelete);
    final trackList = box.values.map((e) {
      return e as FavouriteTrackModel;
    }).toList();
    logger.d('Amount of tracks in Box:${trackList.length}');
  }
}

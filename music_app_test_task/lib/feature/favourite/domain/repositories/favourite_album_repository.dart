import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:music_app_test_task/core/domain/entities/failure.dart';

import '../../data/models/favourite_track_model.dart';

abstract class FavouriteAlbumRepository {
  ValueListenable<Box>? getBoxListenable();

  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox();

  Future<void> insert(FavouriteTrackModel track);

  Future<void> delete(int index);
}

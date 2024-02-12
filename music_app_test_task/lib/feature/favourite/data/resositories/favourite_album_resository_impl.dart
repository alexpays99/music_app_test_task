import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:music_app_test_task/feature/favourite/domain/repositories/favourite_album_repository.dart';

import '../../../../core/domain/entities/failure.dart';
import '../local_datasource/local_datasource.dart';
import '../models/favourite_track_model.dart';

class FavouriteAlbumRepositoryImpl implements FavouriteAlbumRepository {
  FavouriteAlbumRepositoryImpl(this._localDataSource);

  final LocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox() async {
    try {
      return await _localDataSource.readTracksFromBox();
    } catch (e) {
      return left(
          const Failure(name: 'Ooops! Unable to load favourite music!'));
    }
  }

  @override
  Future<void> insert(FavouriteTrackModel track) async {
    try {
      await _localDataSource.insert(track);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<void> delete(int trackId) async {
    try {
      await _localDataSource.delete(trackId);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  ValueListenable<Box>? getBoxListenable() {
    try {
      return _localDataSource.getBoxListenable();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}

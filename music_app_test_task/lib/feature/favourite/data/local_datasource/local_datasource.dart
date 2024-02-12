import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../../../core/domain/entities/failure.dart';
import '../models/favourite_track_model.dart';
import '../services/hive_service.dart';

abstract class LocalDataSource {
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox();

  Future<void> insert(FavouriteTrackModel track);

  Future<void> delete(int trackId);

  ValueListenable<Box>? getBoxListenable();
}

class LocalDataSourceImpl implements LocalDataSource {
  final HiveService hiveService;

  LocalDataSourceImpl(this.hiveService);

  @override
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox() async {
    final data = await hiveService.readTracksFromBox();
    return data.fold(
      (error) => left(error),
      (result) => right(result),
    );
  }

  @override
  Future<void> insert(FavouriteTrackModel track) async {
    await hiveService.insert(track);
  }

  @override
  Future<void> delete(int trackId) async {
    await hiveService.delete(trackId);
  }

  @override
  ValueListenable<Box>? getBoxListenable() {
    return hiveService.getBoxListenable();
  }
}

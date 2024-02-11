import 'package:dartz/dartz.dart';
import 'package:music_app_test_task/feature/home/data/models/artist_list_track/datum.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../domain/entities/artist_base_info_entity.dart';
import '../../domain/repositories/album_repository.dart';
import '../remote_datasource/remote_datasource.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists() async {
    return await _remoteDataSource.fetchArtists();
  }

  @override
  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url}) async {
    return await _remoteDataSource.fetchArtistTrackList(url: url);
  }
}

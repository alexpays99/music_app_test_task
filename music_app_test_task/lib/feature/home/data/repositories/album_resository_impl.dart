import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../domain/repositories/album_repository.dart';
import '../remote_datasource/remote_datasource.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchArtists() async {
    return await _remoteDataSource.fetchArtists();
  }
}

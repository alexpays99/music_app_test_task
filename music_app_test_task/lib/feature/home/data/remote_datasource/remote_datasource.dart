import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../domain/entities/artist_base_info_entity.dart';
import '../models/artist_list_track/datum.dart';
import '../services/http_service.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists();
  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.httpService);

  final HttpService httpService;

  @override
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists() async {
    return await httpService.fetchArtists();
  }

  @override
  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url}) async {
    return await httpService.fetchArtistTrackList(url: url);
  }
}

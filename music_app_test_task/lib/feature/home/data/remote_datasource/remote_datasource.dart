import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../domain/entities/artist_base_info_entity.dart';
import '../services/http_service.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.httpService);

  final HttpService httpService;

  @override
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists() async {
    return await httpService.fetchArtists();
  }
}

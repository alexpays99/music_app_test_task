import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../services/http_service.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchArtists();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.httpService);

  final HttpService httpService;

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchArtists() async {
    return await httpService.fetchArtists();
  }
}

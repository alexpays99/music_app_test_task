import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../entities/artist_base_info_entity.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists();
}

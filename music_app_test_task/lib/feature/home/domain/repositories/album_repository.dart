import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../data/models/artist_list_track/datum.dart';
import '../entities/artist_base_info_entity.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists(
      int startIndex);
  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url});
}

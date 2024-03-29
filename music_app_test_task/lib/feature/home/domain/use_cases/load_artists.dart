import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../entities/artist_base_info_entity.dart';
import '../repositories/album_repository.dart';

class LoadArtistsUseCase extends UseCase<List<ArtistBaseInfoEntity>, int> {
  LoadArtistsUseCase({required this.albumRepository});

  final AlbumRepository albumRepository;

  @override
  Future<Either<Failure, List<ArtistBaseInfoEntity>>> call(int params) async {
    final artists = await albumRepository.fetchArtists(params);
    return artists.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/album_repository.dart';

class AddSongToFavouriteUseCase extends UseCase<Map<String, dynamic>, void> {
  AddSongToFavouriteUseCase({required this.albumRepository});

  final AlbumRepository albumRepository;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call([void params]) async {
    final artists = await albumRepository.fetchArtists();
    return artists.fold(
      (l) => left(l),
      (r) => right({'S': 'S'}),
    );
  }
}

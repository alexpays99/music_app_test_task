import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/favourite_album_repository.dart';

class DeleteTrackFromFavouriteUseCase extends UseCase<void, int> {
  DeleteTrackFromFavouriteUseCase({required this.favouriteAlbumRepository});

  final FavouriteAlbumRepository favouriteAlbumRepository;

  @override
  Future<Either<Failure, void>> call(int params) async {
    try {
      final track = await favouriteAlbumRepository.delete(params);
      return right(track);
    } catch (e) {
      print(e);
      return left(const Failure(name: 'Unable to delete this track.'));
    }
  }
}

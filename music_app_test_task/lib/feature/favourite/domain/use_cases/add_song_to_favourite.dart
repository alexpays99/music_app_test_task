import 'package:dartz/dartz.dart';
import 'package:music_app_test_task/feature/favourite/domain/repositories/favourite_album_repository.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../../data/models/favourite_track_model.dart';

class AddSongToFavouriteUseCase extends UseCase<void, FavouriteTrackModel> {
  AddSongToFavouriteUseCase({required this.favouriteAlbumRepository});

  final FavouriteAlbumRepository favouriteAlbumRepository;

  @override
  Future<Either<Failure, void>> call(FavouriteTrackModel params) async {
    try {
      final track = await favouriteAlbumRepository.insert(params);
      return right(track);
    } catch (e) {
      print(e);
      return left(Failure(name: e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:music_app_test_task/feature/home/data/models/artist_list_track/datum.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/album_repository.dart';

class LoadArtistTracksUseCase extends UseCase<List<Datum>, String> {
  LoadArtistTracksUseCase({required this.albumRepository});

  final AlbumRepository albumRepository;

  @override
  Future<Either<Failure, List<Datum>>> call(String params) async {
    final artists = await albumRepository.fetchArtistTrackList(url: params);
    return artists.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}

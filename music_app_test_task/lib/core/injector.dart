import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:music_app_test_task/feature/favourite/domain/repositories/favourite_album_repository.dart';
import 'package:music_app_test_task/feature/home/domain/repositories/album_repository.dart';
import 'package:music_app_test_task/feature/home/domain/use_cases/load_artists.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/tracks_cubit.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../feature/favourite/data/local_datasource/local_datasource.dart';
import '../feature/favourite/data/models/favourite_track_model.dart';
import '../feature/favourite/data/resositories/favourite_album_resository_impl.dart';
import '../feature/favourite/data/services/hive_service.dart';
import '../feature/favourite/domain/use_cases/add_song_to_favourite.dart';
import '../feature/favourite/domain/use_cases/delete_song_from_favourite.dart';
import '../feature/favourite/presentation/cubit/favourite_tracks_list_cubit.dart';
import '../feature/home/data/remote_datasource/remote_datasource.dart';
import '../feature/home/data/repositories/album_resository_impl.dart';
import '../feature/home/data/services/http_service.dart';
import '../feature/home/domain/use_cases/load_artist_tracks.dart';
import '../navigation/go_rounter.dart';
import '../utils/box_names.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    getIt.registerLazySingleton<Dio>(() => Dio());
    // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Use cases
    getIt.registerLazySingleton(
      () => LoadArtistsUseCase(albumRepository: getIt()),
    );
    getIt.registerLazySingleton(
      () => LoadArtistTracksUseCase(albumRepository: getIt()),
    );
    getIt.registerLazySingleton(
      () => AddSongToFavouriteUseCase(favouriteAlbumRepository: getIt()),
    );
    getIt.registerLazySingleton(
      () => DeleteTrackFromFavouriteUseCase(favouriteAlbumRepository: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(getIt()));
    getIt.registerLazySingleton<FavouriteAlbumRepository>(
        () => FavouriteAlbumRepositoryImpl(getIt()));

    // Data sourses
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(getIt()));
    getIt.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(getIt()));

    // Services
    getIt.registerLazySingleton<HttpService>(
      () => HttpService(
        dio: getIt.get<Dio>(),
      ),
    );
    getIt.registerLazySingleton<HiveService>(
      () => HiveService(),
    );

    // Blocs and Cubits
    getIt.registerLazySingleton(() => ArtistCubit(getIt()));
    getIt.registerLazySingleton(() => TracksCubit(getIt()));
    getIt.registerLazySingleton(() => FavouriteTracksListCubit(getIt()));

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }

  // Local storages
  static Future<void> registerHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(FavouriteTrackAdapter());
    await Hive.openBox(BoxName.tracks);
  }
}

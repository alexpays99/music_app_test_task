import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:music_app_test_task/feature/home/domain/repositories/album_repository.dart';
import 'package:music_app_test_task/feature/home/domain/use_cases/add_song_to_favourite.dart';
import 'package:music_app_test_task/feature/home/domain/use_cases/load_artists.dart';
import 'package:music_app_test_task/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../feature/favourite/data/services/hive_service.dart';
import '../feature/home/data/remote_datasource/remote_datasource.dart';
import '../feature/home/data/repositories/album_resository_impl.dart';
import '../feature/home/data/services/http_service.dart';
import '../navigation/go_rounter.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    getIt.registerLazySingleton<Dio>(() => Dio());
    // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Providers
    getIt.registerLazySingleton(
      () => LoadArtistsUseCase(albumRepository: getIt()),
    );
    getIt.registerLazySingleton(
      () => AddSongToFavouriteUseCase(albumRepository: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(getIt()));

    // Data sourses
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(getIt()));
    // getIt.registerLazySingleton<LocalDataSource>(
    //     () => LocalDataSourceImpl(getIt()));

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
    // getIt.registerLazySingleton(() => IngredientsListBloc());
    // getIt.registerLazySingleton(() => NetworkCubit());
    // getIt.registerLazySingleton(() => SavedRecipesListBloc());
    // getIt.registerLazySingleton(() => DietsListBloc());

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }

  // Local storages
  static Future<void> registerHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    // Hive.registerAdapter(RecipeAdapter());
    // await Hive.openBox(BoxName.recipes);
  }
}

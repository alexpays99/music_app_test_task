import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../navigation/go_rounter.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    getIt.registerLazySingleton<Dio>(() => Dio());
    // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Providers
    // getIt.registerLazySingleton(() => GetRecipesProvider(getIt()));
    // getIt.registerLazySingleton(() => GetRecipeImagesProvider(getIt()));

    // getIt.registerLazySingleton(() => GetSavedRecipesProvider(getIt()));
    // getIt.registerLazySingleton(() => AddRecipeToFavouriteProvider(getIt()));
    // getIt.registerLazySingleton(
    //     () => DeleteRecipeFromFavouriteProvider(getIt()));
    // getIt.registerLazySingleton(() => LogInProvider(getIt()));
    // getIt.registerLazySingleton(() => ResetPasswordProvider(getIt()));
    // getIt.registerLazySingleton(() => VerifyEmailProvider(getIt()));
    // getIt.registerLazySingleton(() => SaveAuthStatusProvider(getIt()));
    // getIt.registerLazySingleton(() => GetAuthStatusProvider(getIt()));
    // getIt.registerLazySingleton(() => SignUpProvider(getIt()));
    // getIt.registerLazySingleton(() => SignOutProvider(getIt()));
    // getIt.registerLazySingleton(() => ListenSavedRecipes(getIt()));
    // getIt.registerLazySingleton(() => DeleteAccountProvider(getIt()));
    // getIt.registerLazySingleton(
    //     () => GetNutritionalSupplementsProvider(getIt()));

    // Repositories
    // getIt.registerLazySingleton<RecipeRepository>(
    //     () => RecipeRepositoryImpl(getIt(), getIt()));
    // getIt.registerLazySingleton<AuthRepository>(
    //     () => AuthRepositoryImpl(getIt()));

    // Data sourses
    // getIt.registerLazySingleton<RemoteRecipesDataSource>(
    //     () => RemoteRecipesDataSourceImpl(getIt()));
    // getIt.registerLazySingleton<LocalRecipesDataSource>(
    //     () => LocalRecipesDataSourceImpl(getIt()));

    // Services
    // getIt.registerLazySingleton<GPTService>(
    //   () => GPTService(
    //     dio: getIt.get<Dio>(),
    //     gptServiceData: getIt.get<GptServiceData>(),
    //     recipeImageData: getIt.get<RecipeImageData>(),
    //   ),
    // );
    // getIt.registerLazySingleton<HiveService>(
    //   () => HiveService(),
    // );
    // getIt.registerLazySingleton<UserStorageService>(
    //   () => UserStorageService(),
    // );
    // getIt.registerLazySingleton(
    //     () => AuthService(userStorageService: getIt.get<UserStorageService>()));

    // getIt.registerLazySingleton<NetworkHelper>(
    //   () => NetworkHelper.instance,
    // );

    // Service resourses
    // getIt.registerLazySingleton(() => GptServiceData());
    // getIt.registerLazySingleton(() => RecipeImageData());

    // Blocs and Cubits
    // getIt.registerLazySingleton(() => AuthBloc());
    // getIt.registerLazySingleton(() => IngredientsListBloc());
    // getIt.registerLazySingleton(() => NetworkCubit());
    // getIt.registerLazySingleton(() => SavedRecipesListBloc());
    // getIt.registerLazySingleton(() => DietsListBloc());
    // getIt.registerLazySingleton(() => SignupBloc());
    // getIt.registerLazySingleton(() => LoginBloc());
    // getIt.registerLazySingleton(() => NutritionalSupplementsBloc());

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

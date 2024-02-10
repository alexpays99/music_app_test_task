import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app_test_task/feature/favourite/presentation/favourite_page.dart';
import 'package:music_app_test_task/navigation/bottom_navigation_bar.dart';

import '../feature/favourite/presentation/favourite_info_page.dart';
import '../feature/home/presentation/artist_info_page.dart';
import '../feature/home/presentation/home_page.dart';
import 'router_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _sectionNavigatorFavouriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favourite');

class GoRouterNavigation {
  GoRouter initGoRoute() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutePaths.home,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return BottomNavigationBarWidget(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: RoutePaths.home,
                  name: RoutePaths.home,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomePage(),
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.artistInfo,
                      name: RoutePaths.artistInfo,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ArtistInfoPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorFavouriteKey,
              routes: [
                GoRoute(
                  path: RoutePaths.favourite,
                  name: RoutePaths.favourite,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: FavouritePage(),
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.favouriteInfo,
                      name: RoutePaths.favouriteInfo,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: FavouriteInfoPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:go_router/go_router.dart';

import 'router_paths.dart';

class GoRouterNavigation {
  GoRouter initGoRoute() {
    return GoRouter(
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.imageListScreen,
          name: RoutePaths.imageListScreen,
          // builder: (context, state) => const ImageListScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: RoutePaths.imageInfoScreen,
              name: RoutePaths.imageInfoScreen,
              // builder: (context, state) {
              //   final imageExtra = state.extra;
              //   if (imageExtra is String) {
              //     return ImageInfoScreen(image: imageExtra);
              //   }
              //   return const ImageInfoScreen(image: '');
              // },
            ),
          ],
        ),
      ],
    );
  }
}

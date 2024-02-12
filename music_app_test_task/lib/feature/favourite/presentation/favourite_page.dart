import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/router_paths.dart';
import 'widgets/favourite_tracks_list.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            context.go(RoutePaths.home);
          },
          tooltip: '',
        ),
      ),
      body: const FavouriteTracksList(),
    );
  }
}

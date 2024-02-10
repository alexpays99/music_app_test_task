import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/router_paths.dart';
import '../../../../utils/ui_constants.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          '${RoutePaths.home}/${RoutePaths.artistInfo}',
          // extra: recipe,
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(bottom: UIConstants.recipeWidgetPadding),
        child: ListTile(
          leading: Text('AA'),
          title: Text('Author'),
        ),
      ),
    );
  }
}

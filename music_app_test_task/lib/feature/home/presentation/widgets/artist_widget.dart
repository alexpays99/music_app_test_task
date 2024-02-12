import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/router_paths.dart';
import '../../../../utils/ui_constants.dart';
import '../../domain/entities/artist_base_info_entity.dart';

class Artist extends StatelessWidget {
  const Artist({
    super.key,
    required this.artist,
    required this.index,
  });

  final ArtistBaseInfoEntity artist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: artist.pictureSmall.isEmpty
          ? null
          : () {
              context.go(
                '${RoutePaths.home}/${RoutePaths.artistInfo}',
                extra: artist,
              );
            },
      child: ListTile(
        leading: ClipRRect(
          borderRadius:
              BorderRadius.circular(UIConstants.photoInfoCardBorderRadius),
          child: CachedNetworkImage(
            imageUrl: artist.pictureSmall,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const CircularProgressIndicator(),
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        title: Text(artist.name ?? ''),
      ),
    );
  }
}

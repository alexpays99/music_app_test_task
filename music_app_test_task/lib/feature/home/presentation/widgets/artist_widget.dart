import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/router_paths.dart';
import '../../../../utils/ui_constants.dart';
import '../../data/models/artist_list_state_model.dart';

class Artist extends StatelessWidget {
  const Artist({
    super.key,
    required this.artistList,
    required this.index,
  });

  final ArtistListStateModel? artistList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          '${RoutePaths.home}/${RoutePaths.artistInfo}',
          extra: artistList?.value?[index],
        );
      },
      child: ListTile(
        leading: artistList?.value?[index].pictureSmall != null &&
                artistList!.value![index].pictureSmall!.isNotEmpty &&
                artistList?.value?[index].pictureSmall != ''
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                    UIConstants.photoInfoCardBorderRadius),
                child: CachedNetworkImage(
                  imageUrl: artistList?.value?[index].pictureSmall ?? '',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(
                    UIConstants.photoInfoCardBorderRadius),
                child: Center(
                  child: Text("${artistList?.value?[index].name?[0]}"),
                ),
              ),
        title: Text("${artistList?.value?[index].name}"),
      ),
    );
  }
}

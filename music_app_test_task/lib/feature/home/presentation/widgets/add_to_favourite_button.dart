import 'package:flutter/material.dart';

import '../../../../core/injector.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/ui_constants.dart';
import '../../../favourite/data/models/favourite_track_model.dart';
import '../../../favourite/domain/use_cases/add_song_to_favourite.dart';
import '../../../favourite/domain/use_cases/delete_song_from_favourite.dart';

class AddToFavouriteButton extends StatefulWidget {
  const AddToFavouriteButton({
    super.key,
    required this.track,
    required this.index,
  });

  final FavouriteTrackModel track;
  final int index;

  @override
  State<AddToFavouriteButton> createState() => _AddToFavouriteButtonState();
}

class _AddToFavouriteButtonState extends State<AddToFavouriteButton> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavourite = !_isFavourite;
        });
        final selectedTrack = widget.track.copyWith(isFavourite: _isFavourite);
        if (_isFavourite) {
          getIt.get<AddSongToFavouriteUseCase>().call(selectedTrack);
        } else {
          getIt.get<DeleteTrackFromFavouriteUseCase>().call(widget.index);
        }
      },
      icon: Icon(
        _isFavourite ? Icons.favorite : Icons.favorite_outline,
        color: _isFavourite
            ? AppColors.selectedRecipeColor
            : AppColors.unselectedRecipeColor,
        size: UIConstants.addToFavouriteIconSize,
      ),
    );
  }
}

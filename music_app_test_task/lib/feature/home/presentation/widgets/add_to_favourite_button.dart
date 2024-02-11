import 'package:flutter/material.dart';
import 'package:music_app_test_task/feature/home/data/models/artist_list_track/datum.dart';

import '../../../../core/injector.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/ui_constants.dart';
import '../../domain/use_cases/add_song_to_favourite.dart';

class AddToFavouriteButton extends StatefulWidget {
  const AddToFavouriteButton({
    super.key,
    required this.track,
    required this.index,
  });

  final Datum track;
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
        if (_isFavourite) {
          getIt.get<AddSongToFavouriteUseCase>().call(widget.track);
        } else {
          // getIt.get<DeleteRecipeFromFavouriteProvider>().call(widget.index);
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

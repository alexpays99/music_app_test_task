// import 'package:flutter/material.dart';

// import '../../data/models/favourite_track_model.dart';

// class RemoveFromFavouriteButton extends StatefulWidget {
//   const RemoveFromFavouriteButton({
//     super.key,
//     required this.track,
//     required this.index,
//   });

//   final FavouriteTrackModel track;
//   final int index;

//   @override
//   State<RemoveFromFavouriteButton> createState() =>
//       _RemoveFromFavouriteButtonState();
// }

// class _RemoveFromFavouriteButtonState extends State<RemoveFromFavouriteButton> {
//   bool _isFavourite = false;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         setState(() {
//           _isFavourite = !_isFavourite;
//         });
//         final selectedTrack = widget.track.copyWith(isFavourite: _isFavourite);
//         if (_isFavourite) {
//           getIt.get<AddSongToFavouriteUseCase>().call(selectedTrack);
//         } else {
//           getIt.get<DeleteTrackFromFavouriteUseCase>().call(widget.index);
//         }
//       },
//       icon: Icon(
//         _isFavourite ? Icons.favorite : Icons.favorite_outline,
//         color: _isFavourite
//             ? AppColors.selectedRecipeColor
//             : AppColors.unselectedRecipeColor,
//         size: UIConstants.addToFavouriteIconSize,
//       ),
//     );
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/favourite_track_list_state_model.dart';
import '../../domain/use_cases/delete_song_from_favourite.dart';

part 'favourite_tracks_list_state.dart';
part 'favourite_tracks_list_cubit.freezed.dart';

class FavouriteTracksListCubit extends Cubit<FavouriteTracksListState> {
  FavouriteTracksListCubit(this._deleteTrackFromFavourite)
      : super(
          FavouriteTracksListState(
            favouriteTrackListStateModel: FavouriteTrackListStateModel(
              trackListData: [],
              trackListState: FavouriteTrackListState.initial,
            ),
          ),
        );

  final DeleteTrackFromFavouriteUseCase _deleteTrackFromFavourite;

  // Future<void> loadFavouriteTracks() async {
  //   try {
  //     final savedRecipesListenable = _listenSavedRecipes.call();
  //     emit(
  //       state.copyWith(
  //         savedRecipesListStateModel: RecipesListStateModel(
  //           recipeListState: ListState.loaded,
  //         ),
  //         valueListenable: savedRecipesListenable,
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> deleteTrackFromFavourite(int trackId) async {
    final result = await _deleteTrackFromFavourite.call(trackId);

    return result.fold(
      (l) => emit(
        state.copyWith(
          favouriteTrackListStateModel: FavouriteTrackListStateModel(
            trackListState: FavouriteTrackListState.loaded,
            message: l.name,
          ),
        ),
      ),
      (r) => emit(
        state.copyWith(
          favouriteTrackListStateModel: FavouriteTrackListStateModel(
            trackListState: FavouriteTrackListState.loaded,
          ),
        ),
      ),
    );
  }
}

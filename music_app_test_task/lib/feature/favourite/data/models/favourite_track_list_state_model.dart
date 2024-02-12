import 'favourite_track_model.dart';

enum FavouriteTrackListState {
  initial,
  loading,
  loaded,
  error,
}

class FavouriteTrackListStateModel {
  FavouriteTrackListStateModel({
    this.trackListData,
    required this.trackListState,
    this.message,
  });

  List<FavouriteTrackModel>? trackListData;
  FavouriteTrackListState trackListState = FavouriteTrackListState.initial;
  String? message;
}

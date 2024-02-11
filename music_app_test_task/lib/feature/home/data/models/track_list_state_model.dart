import 'artist_list_track/datum.dart';

enum TrackListState {
  initial,
  loading,
  loaded,
  error,
}

class TrackListStateModel {
  TrackListStateModel({
    this.trackListData,
    required this.trackListState,
    this.message,
  });

  List<Datum>? trackListData;
  TrackListState trackListState = TrackListState.initial;
  String? message;
}

import 'package:music_app_test_task/feature/home/data/models/artist_list_track/datum.dart';
import 'package:music_app_test_task/feature/home/domain/entities/artist_base_info_entity.dart';

enum ListState {
  initial,
  loading,
  loaded,
  error,
}

enum TrackListState {
  initial,
  loading,
  loaded,
  error,
}

class ArtistListStateModel {
  ArtistListStateModel({
    this.value,
    this.trackListData,
    this.artistListState,
    this.trackListState,
    this.message,
  });

  List<ArtistBaseInfoEntity>? value;
  List<Datum>? trackListData;
  ListState? artistListState = ListState.initial;
  TrackListState? trackListState = TrackListState.initial;
  String? message;
}

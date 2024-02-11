import 'package:music_app_test_task/feature/home/domain/entities/artist_base_info_entity.dart';

enum ListState {
  initial,
  loading,
  loaded,
  error,
}

class ArtistListStateModel {
  ArtistListStateModel({
    this.value,
    this.artistListState,
    this.message,
  });

  List<ArtistBaseInfoEntity>? value;
  ListState? artistListState = ListState.initial;
  String? message;
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../../../../utils/ui_constants.dart';
import '../../data/models/track_list_state_model.dart';
import '../../domain/use_cases/load_artist_tracks.dart';

part 'tracks_state.dart';
part 'tracks_cubit.freezed.dart';

class TracksCubit extends Cubit<TracksState> {
  TracksCubit(
    this._loadArtistTracksUseCase,
  ) : super(
          TracksState(
            trackListStateModel: TrackListStateModel(
              trackListData: [],
              trackListState: TrackListState.initial,
            ),
          ),
        );
  final LoadArtistTracksUseCase _loadArtistTracksUseCase;
  final logger = Logger();

  Future<void> fetchArtistTrackList(String url) async {
    emit(
      state.copyWith(
        trackListStateModel: TrackListStateModel(
          trackListData: null,
          trackListState: TrackListState.loading,
        ),
      ),
    );
    final tracks = await _loadArtistTracksUseCase(url);
    tracks.fold(
      (l) => {
        emit(
          state.copyWith(
            trackListStateModel: TrackListStateModel(
              trackListState: TrackListState.error,
              message: UIConstants.errorMessage,
            ),
          ),
        ),
      },
      (r) => {
        emit(
          state.copyWith(
            trackListStateModel: TrackListStateModel(
              trackListData: r,
              trackListState: TrackListState.loaded,
            ),
          ),
        ),
      },
    );
  }
}

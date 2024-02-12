import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/ui_constants.dart';
import '../../data/models/artist_list_state_model.dart';
import '../../domain/entities/artist_base_info_entity.dart';
import '../../domain/use_cases/load_artists.dart';

part 'artist_state.dart';
part 'artist_cubit.freezed.dart';

class ArtistCubit extends Cubit<ArtistState> {
  ArtistCubit(
    this._loadArtistsUsecase,
  ) : super(
          ArtistState(
            artistListStateModel: ArtistListStateModel(
              value: [],
              artistListState: ListState.initial,
            ),
          ),
        );

  final LoadArtistsUseCase _loadArtistsUsecase;
  List<ArtistBaseInfoEntity> newArtists = [];
  int counter = 1;

  Future<void> fetchArtists() async {
    final startIndex = counter * 10;
    emit(
      state.copyWith(
        artistListStateModel: ArtistListStateModel(
          value: null,
          artistListState: ListState.loading,
        ),
      ),
    );
    final artists = await _loadArtistsUsecase(startIndex);
    artists.fold(
      (l) => {
        emit(
          state.copyWith(
            artistListStateModel: ArtistListStateModel(
              artistListState: ListState.error,
              message: UIConstants.errorMessage,
            ),
          ),
        ),
      },
      (r) => {
        newArtists += List.from(r),
        counter++,
        emit(
          state.copyWith(
            artistListStateModel: ArtistListStateModel(
              value: newArtists,
              artistListState: ListState.loaded,
            ),
          ),
        ),
      },
    );
  }
}

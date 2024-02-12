import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../utils/hive_adapters.dart';
import '../../../home/data/models/artist_list_track/datum.dart';

part 'favourite_track_model.freezed.dart';
part 'favourite_track_model.g.dart';

@freezed
class FavouriteTrackModel with _$FavouriteTrackModel {
  @HiveType(typeId: 0, adapterName: HiveAdapters.favouritetrackAdapter)
  const factory FavouriteTrackModel({
    @HiveField(0) int? id,
    @HiveField(1) String? title,
    @HiveField(2) int? duration,
    @HiveField(3) String? artistName,
    @HiveField(4) @Default(false) bool isFavourite,
  }) = _FavouriteTrackModel;

  factory FavouriteTrackModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteTrackModelFromJson(json);

  factory FavouriteTrackModel.fromRemoteTrackModel(Datum trackModel) =>
      FavouriteTrackModel(
        id: trackModel.id,
        title: trackModel.title,
        duration: trackModel.duration,
        artistName: trackModel.artist?.name,
      );
}

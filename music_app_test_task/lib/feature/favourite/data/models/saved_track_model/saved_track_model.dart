// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';

// import '../../../../../utils/hive_adapters.dart';
// import '../../../../home/data/models/artist_list_track/datum.dart';
// import '../../../domain/entities/saved_track_entity.dart';
// import 'album_local.dart';
// import 'artist_local.dart';

// part 'saved_track_model.freezed.dart';
// part 'saved_track_model.g.dart';

// @freezed
// class SavedTrackModel with _$SavedTrackModel {
//   const SavedTrackModel._();

//   @HiveType(typeId: 1, adapterName: HiveAdapters.trackAdapter)
//   const factory SavedTrackModel({
//     @HiveField(0) int? id,
//     @HiveField(1) String? title,
//     @HiveField(2) @JsonKey(name: 'title_short') String? titleShort,
//     @HiveField(3) int? duration,
//     @HiveField(4) @JsonKey(name: 'md5_image') String? md5Image,
//     @HiveField(5) ArtistLocal? artist,
//     @HiveField(6) AlbumLocal? album,
//   }) = _SavedTrackModel;

//   factory SavedTrackModel.fromJson(Map<String, dynamic> json) =>
//       _$SavedTrackModelFromJson(json);

//   factory SavedTrackModel.fromRemoteTrackModel(Datum trackModel) =>
//       SavedTrackModel(
//         id: trackModel.id,
//         title: trackModel.title,
//         titleShort: trackModel.titleShort,
//         duration: trackModel.duration,
//         md5Image: trackModel.md5Image,
//         artist: trackModel.artist?.toArtistLocal(trackModel.artist!),
//         album: trackModel.album?.toAlbumLocal(trackModel.album!),
//       );

//   SavedTrackEntity get entity => SavedTrackEntity(
//         id: id,
//         title: title,
//         titleShort: titleShort,
//         duration: duration,
//         md5Image: md5Image,
//         artist: artist,
//         album: album?.entity,
//       );
// }

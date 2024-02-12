// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:music_app_test_task/feature/favourite/domain/entities/album_entity.dart';
// import 'package:hive/hive.dart';

// import '../../../../../utils/hive_adapters.dart';

// part 'album.freezed.dart';
// part 'album.g.dart';

// @freezed
// class AlbumLocal with _$AlbumLocal {
//   const AlbumLocal._();

//   @HiveType(typeId: 3, adapterName: HiveAdapters.albumAdapter)
//   const factory AlbumLocal({
//     int? id,
//     String? title,
//     String? cover,
//     @JsonKey(name: 'cover_small') String? coverSmall,
//     @JsonKey(name: 'cover_medium') String? coverMedium,
//     @JsonKey(name: 'cover_big') String? coverBig,
//     @JsonKey(name: 'cover_xl') String? coverXl,
//     @JsonKey(name: 'md5_image') String? md5Image,
//     String? tracklist,
//     String? type,
//   }) = _AlbumLocal;

//   factory AlbumLocal.fromJson(Map<String, dynamic> json) =>
//       _$AlbumLocalFromJson(json);

//   AlbumEntity get entity => AlbumEntity(
//         id: id,
//         title: title,
//         cover: cover,
//         coverSmall: coverSmall,
//         coverMedium: coverMedium,
//         coverBig: coverBig,
//         coverXl: coverXl,
//         md5Image: md5Image,
//         tracklist: tracklist,
//         type: type,
//       );
// }

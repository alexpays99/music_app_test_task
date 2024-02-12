import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app_test_task/feature/favourite/data/models/saved_track_model/album_local.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const Album._();
  const factory Album({
    int? id,
    String? title,
    String? cover,
    @JsonKey(name: 'cover_small') String? coverSmall,
    @JsonKey(name: 'cover_medium') String? coverMedium,
    @JsonKey(name: 'cover_big') String? coverBig,
    @JsonKey(name: 'cover_xl') String? coverXl,
    @JsonKey(name: 'md5_image') String? md5Image,
    String? tracklist,
    String? type,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  // AlbumLocal toAlbumLocal(Album alboModel) => AlbumLocal(
  //       id: alboModel.id,
  //       title: title,
  //       cover: cover,
  //       coverSmall: coverSmall,
  //       coverMedium: coverMedium,
  //       coverBig: coverBig,
  //       coverXl: coverXl,
  //       md5Image: md5Image,
  //       tracklist: tracklist,
  //       type: type,
  //     );

  // AlbumEntity get entity => AlbumEntity(
  //       id: id,
  //       title: title,
  //       cover: cover,
  //       coverSmall: coverSmall,
  //       coverMedium: coverMedium,
  //       coverBig: coverBig,
  //       coverXl: coverXl,
  //       md5Image: md5Image,
  //       tracklist: tracklist,
  //       type: type,
  //     );
}

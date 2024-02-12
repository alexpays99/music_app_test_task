import 'package:freezed_annotation/freezed_annotation.dart';

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
}

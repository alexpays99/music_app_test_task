import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_app_test_task/feature/home/domain/entities/artist_base_info_entity.dart';

part 'artist_base_info.freezed.dart';
part 'artist_base_info.g.dart';

@freezed
class ArtistBaseInfo with _$ArtistBaseInfo {
  const ArtistBaseInfo._();

  const factory ArtistBaseInfo({
    int? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    @JsonKey(name: 'picture_small') String? pictureSmall,
    @JsonKey(name: 'picture_medium') String? pictureMedium,
    @JsonKey(name: 'picture_big') String? pictureBig,
    @JsonKey(name: 'picture_xl') String? pictureXl,
    @JsonKey(name: 'nb_album') int? nbAlbum,
    @JsonKey(name: 'nb_fan') int? nbFan,
    bool? radio,
    String? tracklist,
    String? type,
  }) = _ArtistBaseInfo;

  factory ArtistBaseInfo.fromJson(Map<String, dynamic> json) =>
      _$ArtistBaseInfoFromJson(json);

  ArtistBaseInfoEntity get entity => ArtistBaseInfoEntity(
        id: id,
        name: name,
        link: link,
        share: share,
        picture: picture,
        pictureSmall: pictureSmall,
        pictureMedium: pictureMedium,
        pictureBig: pictureBig,
        pictureXl: pictureXl,
        nbAlbum: nbAlbum,
        nbFan: nbFan,
        radio: radio,
        tracklist: tracklist,
        type: type,
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'album.dart';
import 'artist.dart';
import 'contributor.dart';

part 'datum.freezed.dart';
part 'datum.g.dart';

@freezed
class Datum with _$Datum {
  factory Datum({
    int? id,
    bool? readable,
    String? title,
    @JsonKey(name: 'title_short') String? titleShort,
    @JsonKey(name: 'title_version') String? titleVersion,
    String? link,
    int? duration,
    int? rank,
    @JsonKey(name: 'explicit_lyrics') bool? explicitLyrics,
    @JsonKey(name: 'explicit_content_lyrics') int? explicitContentLyrics,
    @JsonKey(name: 'explicit_content_cover') int? explicitContentCover,
    String? preview,
    List<Contributor>? contributors,
    @JsonKey(name: 'md5_image') String? md5Image,
    Artist? artist,
    Album? album,
    String? type,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

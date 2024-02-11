import 'package:freezed_annotation/freezed_annotation.dart';

import 'datum.dart';

part 'artist_list_track.freezed.dart';
part 'artist_list_track.g.dart';

@freezed
class ArtistListTrack with _$ArtistListTrack {
  const ArtistListTrack._();

  factory ArtistListTrack({
    List<Datum>? data,
    int? total,
    String? next,
  }) = _ArtistListTrack;

  factory ArtistListTrack.fromJson(Map<String, dynamic> json) =>
      _$ArtistListTrackFromJson(json);
}

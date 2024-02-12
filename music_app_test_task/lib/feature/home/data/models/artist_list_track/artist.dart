import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../favourite/data/models/saved_track_model/artist_local.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  const Artist._();

  const factory Artist({
    int? id,
    String? name,
    String? tracklist,
    String? type,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

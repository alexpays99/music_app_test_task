import 'album_entity.dart';
import 'artist_entity.dart';

class SavedTrackEntity {
  SavedTrackEntity({
    required this.id,
    required this.title,
    required this.titleShort,
    required this.duration,
    required this.md5Image,
    required this.artist,
    required this.album,
  });

  final int? id;
  final String? title;
  final String? titleShort;
  final int? duration;
  final String? md5Image;
  final ArtistEntity? artist;
  final AlbumEntity? album;
}

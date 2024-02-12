class ArtistEntity {
  ArtistEntity({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  final int? id;
  final String? name;
  final String? tracklist;
  final String? type;
}

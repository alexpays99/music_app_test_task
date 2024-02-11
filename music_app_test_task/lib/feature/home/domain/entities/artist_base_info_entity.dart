class ArtistBaseInfoEntity {
  ArtistBaseInfoEntity({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.nbAlbum,
    required this.nbFan,
    required this.radio,
    required this.tracklist,
    required this.type,
  });

  final int? id;
  final String? name;
  final String? link;
  final String? share;
  final String? picture;
  final String? pictureSmall;
  final String? pictureMedium;
  final String? pictureBig;
  final String? pictureXl;
  final int? nbAlbum;
  final int? nbFan;
  final bool? radio;
  final String? tracklist;
  final String? type;
}

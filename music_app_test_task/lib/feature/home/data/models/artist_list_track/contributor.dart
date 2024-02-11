import 'package:freezed_annotation/freezed_annotation.dart';

part 'contributor.freezed.dart';
part 'contributor.g.dart';

@freezed
class Contributor with _$Contributor {
  factory Contributor({
    int? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    @JsonKey(name: 'picture_small') String? pictureSmall,
    @JsonKey(name: 'picture_medium') String? pictureMedium,
    @JsonKey(name: 'picture_big') String? pictureBig,
    @JsonKey(name: 'picture_xl') String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,
    String? role,
  }) = _Contributor;

  factory Contributor.fromJson(Map<String, dynamic> json) =>
      _$ContributorFromJson(json);
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:music_app_test_task/feature/home/domain/entities/artist_base_info_entity.dart';

import '../../../../core/domain/entities/failure.dart';
import '../models/artist_base_info/artist_base_info.dart';
import '../models/artist_list_track/artist_list_track.dart';
import '../models/artist_list_track/datum.dart';

class HttpService {
  HttpService({required this.dio});

  final Dio dio;
  final logger = Logger();

  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists() async {
    try {
      final baseUrl = const String.fromEnvironment("BASE_URL").toString();
      final artistEndpoint = const String.fromEnvironment("ARTIST").toString();
      late Response response;
      List<ArtistBaseInfoEntity> artists = [];

      for (int i = 1; i < 10; i++) {
        response = await dio.get('$baseUrl$artistEndpoint$i');
        final json = response.data as Map<String, dynamic>;
        if (response.statusCode == 200) {
          final artist = ArtistBaseInfo.fromJson(json);
          artists.add(artist.entity);
        }
      }

      return right(artists);
    } catch (e) {
      return left(throw Exception(e));
    }
  }

  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url}) async {
    try {
      final response = await dio.get(url);
      final json = response.data as Map<String, dynamic>;
      List<Datum>? data = [];
      if (response.statusCode == 200) {
        final artistListTrack = ArtistListTrack.fromJson(json);
        data = artistListTrack.data?.map((data) => data).toList() ?? [];
        return right(data);
      }
      return right(data);
    } catch (e) {
      return left(throw Exception(e));
    }
  }
}

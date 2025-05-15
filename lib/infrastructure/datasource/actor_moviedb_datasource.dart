import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actor_datasource.dart';

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
        'page': 1,
      },
    ),
  );

  List<Actor> _jsonToActor(Map<String, dynamic> json) {
    final creditsResponse = CreditsResponse.fromJson(json);

    final List<Actor> actor =
        creditsResponse.cast
            .where((cast) => cast.profilePath != 'no-poster')
            .map((moviedb) => ActorMapper.castToEntitiy(moviedb))
            .toList();

    return actor;
  }

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('movie/$movieId/credits');
    return _jsonToActor(response.data);
  }
}

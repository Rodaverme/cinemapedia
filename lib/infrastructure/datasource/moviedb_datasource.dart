import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/movies_datasource.dart';

class MoviedbDatasource extends MovieDatasource {
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
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    

    final moviedbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        moviedbResponse.results
            .where((moviedb) => moviedb.posterPath != 'no-poster')
            .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
            .toList();

    return movies;
  }
}

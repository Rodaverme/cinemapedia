import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  
 Future<List<Movie>> getNowPlaying({int page = 1});
 Future<List<Movie>> getPopular({int page = 1});
 Future<List<Movie>> getTopRated({int page = 1});
 Future<List<Movie>> getupcoming({int page = 1});
}

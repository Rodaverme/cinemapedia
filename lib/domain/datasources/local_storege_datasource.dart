import 'package:cinemapedia/domain/entities/movie.dart';


abstract class LocalStorageDatasource {
  Future<void> toglleFavorite(Movie movie);
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, offset = 0});
  Future<bool> isMovieFavorite(int movieId);
}

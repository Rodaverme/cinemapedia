import 'package:cinemapedia/domain/datasources/local_storege_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repositories.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepositories {
  final LocalStorageDatasource localStorageDatasource;

  LocalStorageRepositoryImpl({required this.localStorageDatasource});

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return localStorageDatasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, offset = 0}) {
    return localStorageDatasource.loadFavoriteMovies(
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<void> toglleFavorite(Movie movie) {
    return localStorageDatasource.toglleFavorite(movie);
  }
}

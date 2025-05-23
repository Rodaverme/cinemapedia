import 'package:cinemapedia/domain/datasources/local_storege_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;
  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        directory: Isar.defaultName,
        inspector: true,
        // Permitir lectura en modo seguro
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isFavoriteMovie != null;
  }

  @override
  Future<void> toglleFavorite(Movie movie) async {
    final isar = await db;

    final isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (isFavoriteMovie != null) {
      // Si la película ya es favorita, eliminarla
      await isar.writeTxnSync(() async {
        isar.movies.deleteSync(isFavoriteMovie.isarId!);
      });
    } else {
      // Si la película no es favorita, agregarla
      await isar.writeTxnSync(() async {
        isar.movies.putSync(movie);
      });
    }
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}

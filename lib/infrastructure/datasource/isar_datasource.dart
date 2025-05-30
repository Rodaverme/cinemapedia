import 'package:cinemapedia/domain/datasources/local_storege_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [MovieSchema],
        directory: dir.path,
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
      // Borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(isFavoriteMovie.isarId!));
      return;
    }

    // Insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}

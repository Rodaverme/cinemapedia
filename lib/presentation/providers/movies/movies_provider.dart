import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {

      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifer(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifer extends StateNotifier<List<Movie>> {
  int currentePage = 0;

  MovieCallback fetchMoreMovies;

  MoviesNotifer({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentePage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentePage);
    state = [...state,...movies];
  }
}

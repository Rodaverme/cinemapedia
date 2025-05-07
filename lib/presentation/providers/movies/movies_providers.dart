import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMovies: fetchMovies);
    });

typedef MoviesCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MoviesCallback fetchMovies;

  MoviesNotifier({required this.fetchMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> newMovies = await fetchMovies(page: currentPage);
    state = [...state, ...newMovies];
  }
}

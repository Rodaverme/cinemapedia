import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifer(fetchMoreMovies: fetchMoreMovies);
});
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifer(fetchMoreMovies: fetchMoreMovies);
});
final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifer(fetchMoreMovies: fetchMoreMovies);
});
final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifer, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifer(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifer extends StateNotifier<List<Movie>> {
  int currentePage = 0;
  bool isloading = false;

  MovieCallback fetchMoreMovies;

  MoviesNotifer({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isloading) return;
    isloading = true;
    currentePage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentePage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isloading = false;
  }
}

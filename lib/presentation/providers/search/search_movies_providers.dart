import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movies_repository_provider.dart';

final searchQuearyProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifier(
      ref: ref, searchMovies: movieRepository.searchMovies);
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final Ref ref;

  SearchMoviesCallback searchMovies;
  SearchMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQuearyProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}

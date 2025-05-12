import 'package:cinemapedia/presentation/providers/movies/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieInfoProvider,Map<String,Movie>> ((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieInfoProvider(getMovie: movieRepository.getMovieById);
});

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMovies: fetchMovies);
    });

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieInfoProvider extends StateNotifier<Map<String, Movie>> {
  MovieInfoProvider({required this.getMovie}) : super({});
  final GetMovieCallback getMovie;
  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}

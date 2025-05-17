import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

import '../models/moviedb/movie_details.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath:
        movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
            : 'https://as1.ftcdn.net/v2/jpg/03/34/83/22/1000_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath:
        movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
            : 'no-poster',
    releaseDate: movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath:
        movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
            : 'https://as1.ftcdn.net/v2/jpg/03/34/83/22/1000_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
    genreIds: movieDB.genres.map((e) => e.name).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath:
        movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
            : 'no-poster',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage.toDouble(),
    voteCount: movieDB.voteCount,
  );
}

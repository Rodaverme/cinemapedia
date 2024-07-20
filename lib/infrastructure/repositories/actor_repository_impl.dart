import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repositories.dart';

class ActorRepositoryImpl extends ActorRepositories {
  final ActorDataSource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}

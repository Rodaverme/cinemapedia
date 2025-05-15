import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorRepositories {
  Future<List<Actor>> getActorByMovie(String movieId);
}

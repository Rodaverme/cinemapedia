import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorDataSource {
  Future<List<Actor>> getActorByMovie(String movieId);
}

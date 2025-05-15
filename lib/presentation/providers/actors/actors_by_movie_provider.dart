import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actor_repository_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((
      ref,
    ) {
      final actorRepository = ref.watch(actorRepositoryProvider);
      return ActorsByMovieNotifier(getActors: actorRepository.getActorByMovie);
    });

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsByMovieNotifier({required this.getActors}) : super({});
  final GetActorsCallback getActors;
  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actor = await getActors(movieId);
    state = {...state, movieId: actor};
  }
}

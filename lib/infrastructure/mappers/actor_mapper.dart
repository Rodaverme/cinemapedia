import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

import '../../domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntitiy(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath:
        cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://img.freepik.com/premium-vector/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-vector-illustration_561158-3383.jpg',
    character: cast.character,
  );
}

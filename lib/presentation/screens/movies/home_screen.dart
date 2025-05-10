import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/movies/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),

      bottomNavigationBar: CustomBottomNavegation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: 
          FlexibleSpaceBar(
            title: CustomAppbar(),titlePadding: EdgeInsets.zero,
            ),
            
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideShowMovies),

                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'Lunes 12',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Próximamente',
                  subtitle: 'MIÉRCOLES 15',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Más populares',
                  subtitle: 'VIERNES 17',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Más valoradas',
                  subtitle: 'Desde Siempre',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),
                SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}

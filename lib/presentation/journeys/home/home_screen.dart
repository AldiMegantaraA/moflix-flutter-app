import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moflix/presentation/widgets/movie_app_bar.dart';

import '../../../di/get_it.dart';
import '../../blocs/movie_backdrop/movie_backdrop_cubit.dart';
import '../../blocs/movie_carousel/movie_carousel_cubit.dart';
import '../../blocs/search_movie/search_movie_cubit.dart';
import '../../widgets/app_error_widget.dart';
import '../drawer/navigation_drawer.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselCubit movieCarouselCubit;
  late MovieBackdropCubit movieBackdropCubit;
  // late MovieTabbedCubit movieTabbedCubit;
  late SearchMovieCubit searchMovieCubit;

  @override
  void initState() {
    super.initState();
    movieCarouselCubit = getItInstance<MovieCarouselCubit>();
    movieBackdropCubit = movieCarouselCubit.movieBackdropCubit;
    searchMovieCubit = getItInstance<SearchMovieCubit>();
    movieCarouselCubit.loadCarousel();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselCubit.close();
    movieBackdropCubit.close();
    searchMovieCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselCubit,
        ),
        BlocProvider(
          create: (context) => movieBackdropCubit,
        ),
        BlocProvider.value(
          value: searchMovieCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: MovieAppBar(),
        ),
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return ListView(
                children: <Widget>[
                  Expanded(
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselCubit.loadCarousel(),
                errorType: state.errorType,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

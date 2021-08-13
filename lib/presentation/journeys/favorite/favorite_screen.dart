import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moflix/common/constants/size_constants.dart';
import 'package:moflix/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:moflix/presentation/blocs/theme/theme_cubit.dart';
import 'package:moflix/presentation/journeys/home/home_screen.dart';
import 'package:moflix/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:moflix/presentation/themes/theme_color.dart';

import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extensions.dart';
import '../../../di/get_it.dart';
import '../../blocs/favorite/favorite_cubit.dart';
import 'favorite_movie_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteCubit>();
    _favoriteBloc.loadFavoriteMovie();
  }

  @override
  void dispose() {
    _favoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.favoriteMovies.t(context),
        ),
        actions: <Widget>[ IconButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())
              );
            },
            icon: Icon(
              Icons.add,
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? Colors.white
                  : AppColor.vulcan,
              size: 20,
            ),
          )],
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovie.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

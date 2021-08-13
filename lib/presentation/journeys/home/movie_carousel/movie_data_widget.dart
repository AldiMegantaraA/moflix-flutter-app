import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moflix/common/constants/size_constants.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../blocs/movie_backdrop/movie_backdrop_cubit.dart';

class MovieDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBackdropCubit, MovieEntity?>(
      builder: (context, movie) {
        return Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [ Container(
          margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12),
          child: Text(
            movie?.title ?? '',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12, top: Sizes.dimen_6),
          child: Text(movie?.overview ?? '',
            textAlign: TextAlign.left,
            maxLines: 5,
            style: TextStyle(
              color: Colors.white60
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12, top: Sizes.dimen_6),
          child: Text('Release Date : ' + '${movie?.releaseDate}',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12
            ),
          )
        )
        ]);
      },
    );
  }
}

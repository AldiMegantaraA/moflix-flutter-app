import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moflix/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:moflix/presentation/journeys/home/movie_carousel/movie_data_widget.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/screenutil/screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../blocs/movie_backdrop/movie_backdrop_cubit.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;

  const MoviePageView({Key? key, required this.movies})
      : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
      final MovieEntity movie = widget.movies[index];
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: MediaQuery.of(context).size.width / 3.5,
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 40, vertical: MediaQuery.of(context).size.width / 20),
            child: MovieCardWidget(movieId: movie.id, posterPath: movie.posterPath,),),
            new Container(
              width: MediaQuery.of(context).size.width / 1.8,
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 40, vertical: MediaQuery.of(context).size.width / 20),
              child: 
              Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Container(
                  margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12),
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12, top: Sizes.dimen_6),
                  child: Text('${movie.overview}',
                    textAlign: TextAlign.left,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.white60
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(left: Sizes.dimen_12, right: Sizes.dimen_12, top: Sizes.dimen_6),
                  child: Text('Release Date : ' + '${movie.releaseDate}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12
                    ),
                  )
                ),
              ])
            )
          ]
        )
        );
      }
    );
  }
}

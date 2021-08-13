import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moflix/presentation/blocs/theme/theme_cubit.dart';
import 'package:moflix/presentation/themes/theme_color.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/screenutil/screenutil.dart';
import '../blocs/search_movie/search_movie_cubit.dart';
import '../journeys/search_movie/custom_search_movie_delegate.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_60.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: Logo(height: Sizes.dimen_16)),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchMovieCubit>(context),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? Colors.white
                  : AppColor.vulcan,
              size: Sizes.dimen_16.h,
            ),
          ),
        ],
      ),
    );
  }
}
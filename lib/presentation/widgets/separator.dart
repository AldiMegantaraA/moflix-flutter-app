import 'package:flutter/material.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../themes/theme_color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_2.h,
      width: Sizes.dimen_80.w,
      margin: EdgeInsets.only(
        top: 12,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        color: Colors.white
      ),
    );
  }
}

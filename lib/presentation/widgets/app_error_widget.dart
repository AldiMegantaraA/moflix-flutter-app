import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';
import '../../domain/entities/app_error.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width / 8,
              width: MediaQuery.of(context).size.width / 2.5,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: onPressed,
                padding: EdgeInsets.all(10.0),
                color: Colors.purple[900],
                textColor: Colors.white,
                child: Text("Retry",
                    style: TextStyle(fontSize: Sizes.dimen_14)),
              ),
            ),
        ],
      ),
    );
  }
}

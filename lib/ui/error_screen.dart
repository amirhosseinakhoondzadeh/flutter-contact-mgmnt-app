import 'package:a_job_thing_test/core/constants/colors.dart';
import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/core/constants/styles.dart';
import 'package:flutter/material.dart';

class ErrorPreviewScreen extends StatelessWidget {
  final String message;
  final String title;
  final VoidCallback onTryAgain;

  ErrorPreviewScreen(
      {@required this.title,
      @required this.message,
      @required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PAGE_BACKGROUND_COLOR,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(),
            Image.asset(AppConstants.ERROR_ICON),
            Container(
              height: 16,
            ),
            Text(
              AppConstants.ERROR_PAGE_TITLE,
              style: titleBoldTextStyle,
            ),
            Container(
              height: 16,
            ),
            Text(
              AppConstants.ERROR_PAGE_MESSAGE,
              style: TextStyle(
                fontFamily: AppConstants.APP_FONT_REGULAR,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.PAGE_TITLE_COLOR,
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: onTryAgain,
              child: Text(
                AppConstants.TRY_AGAIN_BUTTON,
                style: TextStyle(
                    fontFamily: AppConstants.APP_FONT_BOLD,
                    fontSize: 22,
                    color: Colors.lightBlue),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:a_job_thing_test/ui/detail_screen.dart';
import 'package:a_job_thing_test/ui/error_screen.dart';
import 'package:a_job_thing_test/ui/front_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static const String INITIAL = "/";
  static const String DETAIL = "/Detail_Page";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case INITIAL:
        return MaterialPageRoute(builder: (_) => FrontScreen());
      case DETAIL:
        final candidate = settings.arguments as Candidate;
        return MaterialPageRoute(
            builder: (_) => DetailScreen(
                  candidate: candidate,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorPreviewScreen(
            message: 'No route defined for ${settings.name}',
            title: AppConstants.ERROR_PAGE_TITLE,
            onTryAgain: null,
          ),
        );
    }
  }
}

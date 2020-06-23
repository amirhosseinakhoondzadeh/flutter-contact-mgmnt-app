import 'package:a_job_thing_test/blocs/bloc.dart';
import 'package:a_job_thing_test/dependency_injector.dart';
import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:a_job_thing_test/ui/detail_screen.dart';
import 'package:a_job_thing_test/ui/error_screen.dart';
import 'package:a_job_thing_test/ui/front_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/candidates_event.dart';

class Router {
  static const String INITIAL = "/";
  static const String DETAIL = "/Detail_Page";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case INITIAL:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<CandidatesBloc>()
              ..add(
                LoadCandidates(),
              ),
            child: FrontScreen(),
          ),
        );
      case DETAIL:
        final candidate = settings.arguments as Candidate;
        return MaterialPageRoute(
            builder: (_) => DetailScreen(
                  candidate: candidate,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorPreviewScreen(
              message: 'No route defined for ${settings.name}'),
        );
    }
  }
}

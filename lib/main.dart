import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/router.dart';
import 'package:flutter/material.dart';

import 'dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.INITIAL,
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.black45,
        fontFamily: AppConstants.APP_FONT_REGULAR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

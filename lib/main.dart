import 'package:flutter/material.dart';
import 'package:flutter_school/src/shared/injector.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';
import 'package:flutter_school/src/util/navigator/route_generator.dart';

import 'src/shared/web_config/config_non_web.dart'
    if (dart.library.html) 'src/shared/web_config/config_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectorInit();
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appNav = injector.get<AppNav>();
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: '/',
      navigatorKey: appNav.navigatorKey,
      title: 'Flutter School',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

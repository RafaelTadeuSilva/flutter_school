import 'package:flutter/material.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';

class NavigationService implements AppNav {
  @override
  void pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  @override
  Future<T?>? push<T>(String route, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed<T>(route, arguments: arguments);
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

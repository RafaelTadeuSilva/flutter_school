import 'package:flutter/material.dart';

abstract interface class AppNav {
  late GlobalKey<NavigatorState> navigatorKey;
  Future<T?>? push<T>(String routeName, {Object? arguments});
  void pop<T extends Object?>([T? result]);
}

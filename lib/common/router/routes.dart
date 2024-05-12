import 'package:disease_detection/common/router/route_list.dart';
import 'package:disease_detection/view/main_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    RouteList.main: (BuildContext context) => const MainView(),
  };

  Map<String, WidgetBuilder> get allRoutes => _routes;

  static Route getRouteGenerate(RouteSettings settings) =>
      _routeGenerate(settings);

  static Route _routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.main:
        return _buildRoute(
          settings: settings,
          builder: const MainView(),
        );

      default:
        return MaterialPageRoute(
          builder: getRouteByName(settings.name!)!,
          maintainState: false,
          fullscreenDialog: true,
        );
    }
  }

  static WidgetBuilder? getRouteByName(String name) {
    if (_routes.containsKey(name) == false) {
      return _routes[RouteList.main];
    }
    return _routes[name];
  }

  static PageRoute _buildRoute({
    required RouteSettings settings,
    required Widget builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return builder;
      },
    );
  }
}

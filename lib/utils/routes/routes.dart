import 'package:app/utils/routes/routes_name.dart';
import 'package:app/view/homeview.dart';
import 'package:app/view/loginview.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    // setting.arguments;
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => Homeview());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => Loginview());

      default:
        RoutesName.home;
        return MaterialPageRoute(builder: (BuildContext context) => Homeview());
    }
  }
}

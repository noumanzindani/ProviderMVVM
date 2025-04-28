import 'package:app/utils/routes/routes.dart';
import 'package:app/utils/routes/routes_name.dart';
import 'package:app/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthViewmodel())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

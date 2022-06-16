import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/ui/router.dart';
import 'package:kantin_online/ui/views/startup_view.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Online',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primaryColor: colorRed,
      ),
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}

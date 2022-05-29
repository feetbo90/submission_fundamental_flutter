import 'package:flutter/material.dart';

import 'ui/details_screens.dart';
import 'ui/home_screens.dart';
import 'ui/splash_screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        HomeScreens.routeName: (context) => const HomeScreens(),
        DetailsScreens.routeName: (context) => DetailsScreens(
          restaurant: ModalRoute.of(context)?.settings.arguments as dynamic,
        ),
      },
    );
  }
}

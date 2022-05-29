import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/screens/details_screens.dart';
import 'screens/home_screens.dart';
import 'screens/splash_screens.dart';

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
        HomeScreens.routeName: (context) => HomeScreens(),
        DetailsScreens.routeName: (context) => DetailsScreens(
          restaurant: ModalRoute.of(context)?.settings.arguments as dynamic,
        ),
      },
    );
  }
}

import 'package:ddgood/splash.dart';
import 'package:flutter/material.dart';

import 'drawer/calendar.dart';
import 'drawer/wordcloud.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ddgood',
      initialRoute: '/splash',
      routes: {
        // '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
        '/splash': (BuildContext context) => const SplashPage(),
        '/wordcloud': (BuildContext context) => const WordCloudPage(),
        '/calendar': (BuildContext context) => const CalendarPage(),
      },
      // theme: ThemeData.light(useMaterial3: true),
    );
  }
}

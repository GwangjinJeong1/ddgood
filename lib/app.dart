import 'package:flutter/material.dart';

import 'diary.dart';
import 'drawer/calendar.dart';
import 'drawer/wordcloud.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ddgood',
        initialRoute: '/',
        routes: {
          // '/login': (BuildContext context) => const LoginPage(),
          '/': (BuildContext context) => const HomePage(),
          '/wordcloud': (BuildContext context) => const WordCloudPage(),
          '/calendar': (BuildContext context) => const CalendarPage(),
          '/diary': (BuildContext context) => const DiaryPage()
        },
        // theme: ThemeData.light(useMaterial3: true),
      );
  }
}
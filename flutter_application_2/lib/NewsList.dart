import 'package:flutter/material.dart';

import 'package:flutter_application_2/ui/pages/news_page.dart';

class MyNews extends StatelessWidget {
  const MyNews({super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsRicKandMorty(title: 'rick and morty',),
      title: 'News Rick and Morty',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
            headline3: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
            bodyText2: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w200, color: Colors.black),
            caption: TextStyle(
                fontSize: 11, fontWeight: FontWeight.w100, color: Colors.grey),
          )),
    );
  }
}


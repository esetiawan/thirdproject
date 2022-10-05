import 'package:flutter/material.dart';
import 'package:thirdproject/detail_news.dart';
import 'package:thirdproject/more_news.dart';
import 'package:thirdproject/news_screen.dart';
import 'package:thirdproject/model/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korean Drama App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsScreen.routeName,
      routes: {
        NewsScreen.routeName: (context)=>const NewsScreen(),
        DetailNewsScreen.routeName: (context) => DetailNewsScreen(
          article: ModalRoute.of(context)?.settings.arguments as Article
        ),
        MoreNewsScreen.routeName: (context) => MoreNewsScreen(url:
          ModalRoute.of(context)?.settings.arguments as String
        ),
      }
    );
  }
}





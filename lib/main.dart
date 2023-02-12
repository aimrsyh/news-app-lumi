import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lumi_news/page/home.dart';
import 'package:lumi_news/page/home/news_details_page.dart';
import 'package:lumi_news/page/settings/settings_page.dart';
import 'package:lumi_news/page/settings/topics/topics_page.dart';
import 'package:lumi_news/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

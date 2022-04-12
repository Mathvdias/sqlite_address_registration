import 'package:flutter/material.dart';
import 'package:sqllite_sample/database/app_database.dart';

import 'screens/home_page_view.dart';

void main() {
  runApp(const MyApp());
  findAll().then((userAddressList) {
    debugPrint(userAddressList.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageView(),
    );
  }
}

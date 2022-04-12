import 'package:flutter/material.dart';
import 'package:sqllite_sample/screens/my_home_page.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Container(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
        ));
  }
}

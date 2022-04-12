import 'package:flutter/material.dart';
import 'package:sqllite_sample/database/app_database.dart';
import 'package:sqllite_sample/model/user_adress.dart';
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
          child: FutureBuilder<List<UserAddressModel>>(
            initialData: const [],
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  final List<UserAddressModel>? users = snapshot.data;
                  return ListView.builder(
                      itemCount: users!.length,
                      itemBuilder: (context, index) {
                        final UserAddressModel user = users[index];
                        return Text(user.bairro.toString());
                      });
              }
              return const Text('Error');
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
        ));
  }
}

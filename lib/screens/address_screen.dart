import 'package:flutter/material.dart';
import 'package:sqllite_sample/database/dao/address_dao.dart';
import 'package:sqllite_sample/model/user_adress.dart';
import 'package:sqllite_sample/screens/create_address_screen.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  final AddressDao _dao = AddressDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: FutureBuilder<List<UserAddressModel>>(
            initialData: const [],
            future: _dao.findAll(),
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
                        return _AddressItem(key, user);
                      });
              }
              return const Text('Error');
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateAddressScreen()));
          }),
        ));
  }
}

class _AddressItem extends StatelessWidget {
  final UserAddressModel user;

  const _AddressItem(
    Key? key,
    this.user,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          user.rua,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          user.numero,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

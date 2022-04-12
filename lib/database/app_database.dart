import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user_adress.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(
      dbPath,
      'dataAddress.db',
    );
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE address('
            'id INTEGER PRIMARY KEY, '
            'cep TEXT, '
            'rua TEXT, '
            'numero TEXT, '
            'bairro TEXT, '
            'complemento TEXT, '
            'cidade TEXT, '
            'estado TEXT)');
      },
      version: 1,
     // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(UserAddressModel userAdress) {
  return createDatabase().then((db) {
    final Map<String, dynamic> addressMap = {};
    addressMap['cep'] = userAdress.cep;
    addressMap['rua'] = userAdress.rua;
    addressMap['numero'] = userAdress.numero;
    addressMap['bairro'] = userAdress.bairro;
    addressMap['complemento'] = userAdress.complemento;
    addressMap['cidade'] = userAdress.cidade;
    addressMap['estado'] = userAdress.estado;
    return db.insert('address', addressMap);
  });
}

Future<List<UserAddressModel>> findAll() {
  return createDatabase().then((db) {
    return db.query('address').then((maps) {
      final List<UserAddressModel> userAddressList = [];
      for (Map<String, dynamic> map in maps) {
        final UserAddressModel userAddress = UserAddressModel(
          map['id'],
          map['cep'],
          map['rua'],
          map['numero'],
          map['bairro'],
          map['complemento'],
          map['cidade'],
          map['estado'],
        );
        userAddressList.add(userAddress);
      }
      return userAddressList;
    });
  });
}

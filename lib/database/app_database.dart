import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user_adress.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'dataAddress.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE address('
        'id INTEGER PRIMARY KEY, '
        'cep TEXT, '
        'rua TEXT, '
        'numero TEXT, '
        'bairro TEXT, '
        'complemento TEXT, '
        'cidade TEXT, '
        'estado TEXT)',
      );
    },
    // onDowngrade: onDatabaseDowngradeDelete,
    version: 1,
  );
}

Future<int> save(UserAddressModel userAdress) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> addressMap = {};
  addressMap['cep'] = userAdress.cep;
  addressMap['rua'] = userAdress.rua;
  addressMap['numero'] = userAdress.numero;
  addressMap['bairro'] = userAdress.bairro;
  addressMap['complemento'] = userAdress.complemento;
  addressMap['cidade'] = userAdress.cidade;
  addressMap['estado'] = userAdress.estado;
  return db.insert('address', addressMap);
}

Future<List<UserAddressModel>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('address');
  final List<UserAddressModel> userAddressList = [];
  for (Map<String, dynamic> row in result) {
    final UserAddressModel userAddress = UserAddressModel(
      row['id'],
      row['cep'],
      row['rua'],
      row['numero'],
      row['bairro'],
      row['complemento'],
      row['cidade'],
      row['estado'],
    );
    userAddressList.add(userAddress);
  }
  return userAddressList;
}

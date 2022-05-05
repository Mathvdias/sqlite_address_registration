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



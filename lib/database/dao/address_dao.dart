import 'package:sqflite/sqflite.dart';
import 'package:sqllite_sample/model/user_adress.dart';

import '../app_database.dart';

class AddressDao {
  Future<int> save(UserAddressModel userAdress) async {
  final Database db = await getDatabase();
  Map<String, dynamic> addressMap = _toMap(userAdress);
  return db.insert('address', addressMap);
}

  Map<String, dynamic> _toMap(UserAddressModel userAdress) {
    final Map<String, dynamic> addressMap = {};
    addressMap['cep'] = userAdress.cep;
    addressMap['rua'] = userAdress.rua;
    addressMap['numero'] = userAdress.numero;
    addressMap['bairro'] = userAdress.bairro;
    addressMap['complemento'] = userAdress.complemento;
    addressMap['cidade'] = userAdress.cidade;
    addressMap['estado'] = userAdress.estado;
    return addressMap;
  }

Future<List<UserAddressModel>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('address');
  List<UserAddressModel> userAddressList = _toList(result);
  return userAddressList;
}

List<UserAddressModel> _toList(List<Map<String, dynamic>> result) {
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
}
import 'package:flutter/material.dart';
import 'package:sqllite_sample/database/app_database.dart';
import 'package:sqllite_sample/model/user_adress.dart';

class MyHomePageController extends ChangeNotifier {
  final TextEditingController cepController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();

  void sendData(context) {
    final String cep = cepController.text;
    final String rua = ruaController.text;
    final String numero = numeroController.text;
    final String bairro = bairroController.text;
    final String complemento = complementoController.text;
    final String cidade = cidadeController.text;
    final String estado = ufController.text;

    final UserAddressModel newData = UserAddressModel(
        0, cep, rua, numero, bairro, complemento, cidade, estado);
    save(newData).then((id) => Navigator.pop(context));
    debugPrint(newData.toString());
  }

  void findAdress() {
    findAll();
    notifyListeners();
  }
}

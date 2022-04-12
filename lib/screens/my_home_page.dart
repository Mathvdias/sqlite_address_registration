import 'package:flutter/material.dart';
import 'package:sqllite_sample/model/user_adress.dart';

import 'components/address_field_component.dart';
import 'components/cep_field_component.dart';
import 'components/city_field_component.dart';
import 'components/complement_field_component.dart';
import 'components/country_field_component.dart';
import 'components/neighborhood_field_component.dart';
import 'components/number_field_component.dart';
import 'components/state_field_component.dart';

final TextEditingController cepController = TextEditingController();
final TextEditingController ruaController = TextEditingController();
final TextEditingController numeroController = TextEditingController();
final TextEditingController bairroController = TextEditingController();
final TextEditingController complementoController = TextEditingController();
final TextEditingController cidadeController = TextEditingController();
final TextEditingController ufController = TextEditingController();
  final formKey = GlobalKey<FormState>();
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de endereço'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CepFieldComponent(
              controller: cepController,
            ),
            const SizedBox(height: 28),
            AddressFieldComponent(
              controller: ruaController,
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: NumberFieldComponent(
                  controller: numeroController,
                )),
                const SizedBox(width: 15),
                Expanded(
                    child: NeighborhoodsFieldComponent(
                  controller: bairroController,
                )),
              ],
            ),
            const SizedBox(height: 28),
            ComplementFieldComponent(
              controller: complementoController,
            ),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: CityFieldComponent(
                      controller: cidadeController,
                    )),
                const SizedBox(width: 15),
                Expanded(
                    child: StateFieldComponent(
                  controller: ufController,
                )),
              ],
            ),
            const SizedBox(height: 28),
            const CountryFieldComponent(),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("VOLTAR"),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final String cep = cepController.text;
                            final String rua = ruaController.text;
                            final String numero = numeroController.text;
                            final String bairro = bairroController.text;
                            final String complemento =
                                complementoController.text;
                            final String cidade = cidadeController.text;
                            final String estado = ufController.text;

                            final UserAddressModel newData = UserAddressModel(0, cep, rua,
                                numero, bairro, complemento, cidade, estado);
                            debugPrint(newData.toString());
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('SALVAR')))
              ],
            )
          ],
        ),
      ),
    );
  }
}

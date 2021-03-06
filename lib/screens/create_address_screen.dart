import 'package:flutter/material.dart';
import 'package:sqllite_sample/controller/my_home_page_controller.dart';

import 'components/address_field_component.dart';
import 'components/cep_field_component.dart';
import 'components/city_field_component.dart';
import 'components/complement_field_component.dart';
import 'components/country_field_component.dart';
import 'components/neighborhood_field_component.dart';
import 'components/number_field_component.dart';
import 'components/state_field_component.dart';

class CreateAddressScreen extends StatefulWidget {
  const CreateAddressScreen({Key? key}) : super(key: key);

  @override
  State<CreateAddressScreen> createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
  final formKey = GlobalKey<FormState>();
  final controller = MyHomePageController();
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
              controller: controller.cepController,
            ),
            const SizedBox(height: 28),
            AddressFieldComponent(
              controller: controller.ruaController,
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: NumberFieldComponent(
                  controller: controller.numeroController,
                )),
                const SizedBox(width: 15),
                Expanded(
                    child: NeighborhoodsFieldComponent(
                  controller: controller.bairroController,
                )),
              ],
            ),
            const SizedBox(height: 28),
            ComplementFieldComponent(
              controller: controller.complementoController,
            ),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: CityFieldComponent(
                      controller: controller.cidadeController,
                    )),
                const SizedBox(width: 15),
                Expanded(
                    child: StateFieldComponent(
                  controller: controller.ufController,
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
                            controller.sendData(context);
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

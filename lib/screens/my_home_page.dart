import 'package:flutter/material.dart';

import 'components/address_field_component.dart';
import 'components/cep_field_component.dart';
import 'components/city_field_component.dart';
import 'components/complement_field_component.dart';
import 'components/country_field_component.dart';
import 'components/neighborhood_field_component.dart';
import 'components/number_field_component.dart';
import 'components/state_field_component.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de endereço'),
      ),
      body: 
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const CepFieldComponent(),
            const SizedBox(height: 28),
            const AddressFieldComponent(),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: NumberFieldComponent()),
                SizedBox(width: 15),
                Expanded(child: NeighborhoodsFieldComponent()),
              ],
            ),
            const SizedBox(height: 28),
            const ComplementFieldComponent(),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(flex: 2, child: CityFieldComponent()),
                SizedBox(width: 15),
                Expanded(child: StateFieldComponent()),
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
                          Navigator.pop(context);
                        },
                        child: const Text('SALVAR')))
              ],
            )
          ],
        ),
    );
  }
}
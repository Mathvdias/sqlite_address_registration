
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepFieldComponent extends StatelessWidget {
  const CepFieldComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataTheme = Theme.of(context).copyWith(
        primaryColor: Colors.grey,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith());

    return Theme(
      data: _dataTheme,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,

        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }

          if (value.length < 10) {
            return 'CEP inválido';
          }
        },
        decoration: const InputDecoration(labelText: 'CEP'),
      ),
    );
  }
}

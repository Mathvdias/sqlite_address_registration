import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityFieldComponent extends StatelessWidget {
  const CityFieldComponent({Key? key}) : super(key: key);

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
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }

          if (value.trim().isEmpty) {
            return 'Cidade inválida';
          }
        },
        decoration: const InputDecoration(
          labelText: 'Cidade',
        ),
      ),
    );
  }
}

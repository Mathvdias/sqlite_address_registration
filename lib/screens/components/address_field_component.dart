
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressFieldComponent extends StatelessWidget {
  const AddressFieldComponent({Key? key}) : super(key: key);

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
        keyboardType: TextInputType.streetAddress,
        inputFormatters: [
          LengthLimitingTextInputFormatter(32),
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }

          if (value.trim().isEmpty) {
            return 'Rua inválida';
          }
        },
        decoration: const InputDecoration(
          labelText: 'Rua, avenida...',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeighborhoodsFieldComponent extends StatelessWidget {
    final TextEditingController controller;
  const NeighborhoodsFieldComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataTheme = Theme.of(context).copyWith(
        primaryColor: Colors.grey,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith());

    return Theme(
      data: _dataTheme,
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.streetAddress,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }

          if (value.trim().isEmpty) {
            return 'Bairro inválido';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Bairro',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StateFieldComponent extends StatelessWidget {
  const StateFieldComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataTheme = Theme.of(context).copyWith(
        primaryColor: Colors.grey,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith());

    return Theme(
      data: _dataTheme,
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
          LengthLimitingTextInputFormatter(2)
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Estado',
        ),
      ),
    );
  }
}

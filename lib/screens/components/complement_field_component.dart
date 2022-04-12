import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComplementFieldComponent extends StatelessWidget {
    final TextEditingController controller;
  const ComplementFieldComponent({
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
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]")),
        ],
        decoration: const InputDecoration(
          labelText: 'Complemento',
          helperText: 'Esse campo é opcional',
        ),
      ),
    );
  }
}

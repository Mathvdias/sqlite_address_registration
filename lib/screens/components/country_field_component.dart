import 'package:flutter/material.dart';

class CountryFieldComponent extends StatelessWidget {
  const CountryFieldComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataTheme = Theme.of(context).copyWith(
        primaryColor: Colors.grey,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith());

    return Theme(
      data: _dataTheme,
      child: TextFormField(
        enabled: false,
        initialValue: 'BRA',
        style: const TextStyle(color: Colors.grey),
        decoration: const InputDecoration(
          labelText: 'País',
        ),
      ),
    );
  }
}

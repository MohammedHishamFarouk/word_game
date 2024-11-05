import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key, required this.controller, required this.enabled});

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: MediaQuery.of(context).size.width / 9,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: TextInputType.name,
        autofocus: true,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        style: const TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s'))
        ],
        onSaved: (pin1) {},
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
          if (value.isEmpty) FocusScope.of(context).previousFocus();
        },
      ),
    );
  }
}

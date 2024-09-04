import 'package:flutter/material.dart';
import 'package:coolie_wala/core/theme/constants.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneNumberInput({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      cursorColor: primaryColor,
      autofocus: true,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        hintText: "99999-99999",
        labelText: "Phone Number",
        contentPadding: kTextFieldPadding,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}

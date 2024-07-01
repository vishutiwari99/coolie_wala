// import 'package:coolie_wala/core/theme/constants.dart';
import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';

class AuthField extends StatelessWidget {
  final String hinttext;
  const AuthField({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hinttext),
      onSaved: (value) {},
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hinttext is missing';
        }
        return null;
      },
    );
  }
}

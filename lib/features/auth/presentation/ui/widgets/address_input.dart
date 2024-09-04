import 'package:flutter/material.dart';

class AddressInput extends StatelessWidget {
  final TextEditingController controller;

  const AddressInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Address'),
    );
  }
}

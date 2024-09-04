import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../widgets/address_input.dart';

class AddressScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();

  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Address')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AddressSaved) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AddressInput(controller: addressController),
                ElevatedButton(
                  onPressed: () {
                    if (state is Authenticated) {
                      context.read<AuthBloc>().add(
                            SaveAddressEvent(
                                state.user.userId, addressController.text),
                          );
                    }
                  },
                  child: const Text('Save Address'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

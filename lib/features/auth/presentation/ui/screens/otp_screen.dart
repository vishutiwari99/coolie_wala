import 'package:coolie_wala/components/buttons/primary_button.dart';
import 'package:coolie_wala/components/welcome_text.dart';
import 'package:coolie_wala/core/theme/constants.dart';
import 'package:coolie_wala/features/auth/presentation/bloc/auth_event.dart';
import 'package:coolie_wala/features/auth/presentation/ui/widgets/otp_input_v2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';

class OtpScreen extends StatelessWidget {
  final GlobalKey<OtpFormState> otpFormKey = GlobalKey<OtpFormState>();
  final TextEditingController otpController = TextEditingController();
  final String verificationId;

  OtpScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Enter OTP')),
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamed('/address');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeText(
                    title: "Verify phone number",
                    text: "Enter the 4-Digit code sent to you at \n+1501333982",
                  ),

                  // OTP form
                  // const OtpInput(),
                  // if (state is OtpSent)
                  OtpForm(
                    key: otpFormKey,
                  ),
                  PrimaryButton(
                    text: "Continue",
                    press: () {
                      final otp = otpFormKey.currentState?.getOtp();
                      if (otp != null && otp.length == 6) {
                        if (state is OtpSent) {
                          context.read<AuthBloc>().add(
                                ConfirmOtpEvent(state.verificationId, otp),
                              );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please enter the full OTP")),
                        );
                      }
                      // if (_formKey.currentState!.validate()) {
                      //   // If all data are correct then save data to out variables
                      //   final otp = _pin1Controller.text +
                      //       _pin2Controller.text +
                      //       _pin3Controller.text +
                      //       _pin4Controller.text +
                      //       _pin5Controller.text +
                      //       _pin6Controller.text;

                      //   context.read<AuthBloc>().add(ConfirmOtpEvent(
                      //         widget.verificationId,
                      //         otp,
                      //       ));

                      //   // Navigator.push(
                      //   //   context,
                      //   //   MaterialPageRoute(
                      //   //     builder: (context) => const EntryPoint(),
                      //   //   ),
                      //   // );
                      // } else {}
                    },
                  ),

                  const SizedBox(height: defaultPadding),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Didn’t receive code? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Resend Again.",
                            style: const TextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Your OTP PIN resend code
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Center(
                    child: Text(
                      "By Signing up you agree to our Terms \nConditions & Privacy Policy.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          );
        }));
  }
}

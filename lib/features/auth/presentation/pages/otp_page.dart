import 'package:coolie_wala/components/welcome_text.dart';
import 'package:coolie_wala/core/theme/constants.dart';
import 'package:coolie_wala/features/auth/presentation/pages/components/otp_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  final String verificationId;
  const OtpPage({
    super.key,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to Foodly"),
      ),
      body: SingleChildScrollView(
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
              const OtpForm(),
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
      ),
    );
  }
}

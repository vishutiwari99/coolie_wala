// import 'package:coolie_wala/components/buttons/socal_button.dart';
import 'package:coolie_wala/components/welcome_text.dart';
import 'package:coolie_wala/core/theme/constants.dart';
import 'package:coolie_wala/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:coolie_wala/features/auth/presentation/pages/otp_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firmNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimPasswordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormBuilderState>();
  // bool _obscureText = true;

  @override
  void dispose() {
    firmNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confimPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP sent')),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtpPage(
                  verificationId: 'hello',
                ),
              ),
            );
            // Navigate to another screen or perform further actions
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP failed')),
            );
          }
        },
        builder: (context, state) {
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
                    title: "Create Account",
                    text: "Enter your Name, Email and Password \nfor sign up.",
                  ),
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'firmName',
                          decoration:
                              const InputDecoration(labelText: 'Firm Name'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Firm Name is required'),
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        FormBuilderTextField(
                          controller: emailController,
                          name: 'email',
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        FormBuilderTextField(
                          controller: passwordController,
                          name: 'password',
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(8,
                                errorText:
                                    'Password must be at least 8 characters long'),
                            FormBuilderValidators.match(r'(?=.*?[#?!@$%^&*-])',
                                errorText:
                                    'Passwords must have at least one special character')
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        FormBuilderTextField(
                          controller: confimPasswordController,
                          name: 'confirmPassword',
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(8,
                                errorText:
                                    'Password must be at least 8 characters long'),
                            FormBuilderValidators.match(r'(?=.*?[#?!@$%^&*-])',
                                errorText:
                                    'Passwords must have at least one special character')
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        FormBuilderTextField(
                          name: 'GSTNo',
                          decoration:
                              const InputDecoration(labelText: 'GST No.'),
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 15,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'GST No. is required'),
                            FormBuilderValidators.minLength(15,
                                errorText: 'GST No. should be 15 characters'),
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        FormBuilderTextField(
                          controller: phoneNumberController,
                          name: 'phonenumber',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 10,
                          decoration:
                              const InputDecoration(labelText: 'Phone Number'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(10,
                                errorText: 'Please enter a valid phone number'),
                            FormBuilderValidators.maxLength(10,
                                errorText: 'Please enter a valid phone number'),
                          ]),
                        ),
                        const SizedBox(height: defaultPadding),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                              text: "Already have an account? ",
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Sign In",
                                    style: const TextStyle(color: primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => SignInPage(),
                                        //   ),
                                        // );
                                      }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              final formData = _formKey.currentState?.value;
                              context.read<AuthBloc>().add(AuthSignUp(
                                    email: formData?['email'],
                                    password: formData?['password'],
                                    firmName: formData?['firmName'],
                                    phoneNumber: formData?['phonenumber'],
                                  ));
                            }
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

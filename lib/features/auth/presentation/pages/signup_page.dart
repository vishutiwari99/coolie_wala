// import 'package:coolie_wala/components/buttons/socal_button.dart';
import 'package:coolie_wala/components/welcome_text.dart';
import 'package:coolie_wala/core/theme/constants.dart';
// import 'package:coolie_wala/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimPasswordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormBuilderState>();
  // bool _obscureText = true;

  @override
  void dispose() {
    fullNameController.dispose();
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
      body: SingleChildScrollView(
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
                      // key: _emailFieldKey,
                      name: 'firmName',
                      decoration: const InputDecoration(labelText: 'Firm Name'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Firm Name is requird'),
                        // FormBuilderValidators.,
                      ]),
                    ),
                    const SizedBox(height: defaultPadding),
                    FormBuilderTextField(
                      // key: _emailFieldKey,
                      name: 'email',
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: FormBuilderValidators.compose([
                        // FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: defaultPadding),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8,
                            errorText:
                                'Password must be at least 8 digits long'),
                        FormBuilderValidators.match(r'(?=.*?[#?!@$%^&*-/])')
                      ]),
                    ),
                    const SizedBox(height: defaultPadding),
                    FormBuilderTextField(
                      name: 'confirmPassword',
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8,
                            errorText:
                                'Password must be at least 8 digits long'),
                        FormBuilderValidators.match(r'(?=.*?[#?!@$%^&*-/])',
                            errorText:
                                'Passwords must have at least one special character')
                      ]),
                    ),
                    const SizedBox(height: defaultPadding),
                    FormBuilderTextField(
                      // key: _emailFieldKey,
                      name: 'GSTNo',
                      decoration: const InputDecoration(labelText: 'GST No.'),
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 15,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'GST No. is requird'),
                        FormBuilderValidators.minLength(15,
                            errorText: 'GST no. should be in 15 character'),
                      ]),
                    ),
                    const SizedBox(height: defaultPadding),
                    FormBuilderTextField(
                      name: 'phonenumber',
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 10,
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      // obscureText: true,
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
                          text: "Already have account? ",
                          children: <TextSpan>[
                            TextSpan(
                                text: "Sign In",
                                style: const TextStyle(color: primaryColor),
                                recognizer: TapGestureRecognizer()
                                // ..onTap = () => Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => const SignInScreen(),
                                //       ),
                                //     ),
                                ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    ElevatedButton(
                      onPressed: () {
                        // Validate and save the form values
                        final validated =
                            _formKey.currentState?.saveAndValidate();
                        if (validated == true) {}

                        _formKey.currentState?.validate();
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: defaultPadding),
              // Already have account
            ],
          ),
        ),
      ),
    );
  }
}

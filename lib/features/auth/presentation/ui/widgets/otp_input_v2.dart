import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:coolie_wala/core/theme/constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
  });

  @override
  OtpFormState createState() => OtpFormState();
}

class OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  final _pin1Controller = TextEditingController();
  final _pin2Controller = TextEditingController();
  final _pin3Controller = TextEditingController();
  final _pin4Controller = TextEditingController();
  final _pin5Controller = TextEditingController();
  final _pin6Controller = TextEditingController();

  FocusNode? _pin1Node;
  FocusNode? _pin2Node;
  FocusNode? _pin3Node;
  FocusNode? _pin4Node;
  FocusNode? _pin5Node;
  FocusNode? _pin6Node;

  @override
  void initState() {
    super.initState();
    _pin1Node = FocusNode();
    _pin2Node = FocusNode();
    _pin3Node = FocusNode();
    _pin4Node = FocusNode();
    _pin5Node = FocusNode();
    _pin6Node = FocusNode();
  }

  @override
  void dispose() {
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
    _pin5Controller.dispose();
    _pin6Controller.dispose();
    _pin1Node!.dispose();
    _pin2Node!.dispose();
    _pin3Node!.dispose();
    _pin4Node!.dispose();
    _pin5Node!.dispose();
    _pin6Node!.dispose();
    super.dispose();
  }

  String getOtp() {
    return _pin1Controller.text +
        _pin2Controller.text +
        _pin3Controller.text +
        _pin4Controller.text +
        _pin5Controller.text +
        _pin6Controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin1Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin2Node!.requestFocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  autofocus: true,
                  maxLength: 1,
                  focusNode: _pin1Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin2Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin3Node!.requestFocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin2Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin3Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin4Node!.requestFocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin3Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin4Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin5Node!.requestFocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin4Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin5Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin6Node!.requestFocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin5Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: TextFormField(
                  controller: _pin6Controller,
                  onChanged: (value) {
                    if (value.length == 1) _pin6Node!.unfocus();
                  },
                  validator: RequiredValidator(errorText: '').call,
                  maxLength: 1,
                  focusNode: _pin6Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding * 2),
          // Continue Button
        ],
      ),
    );
  }
}

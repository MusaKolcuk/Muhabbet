import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/register_controller.dart';
import 'package:muhabbet/widgets/filled_rounded.dart';
import 'package:muhabbet/widgets/otp_page.dart';

class RegisterValidation extends StatefulWidget {
  const RegisterValidation({super.key});

  @override
  State<RegisterValidation> createState() => _RegisterValidationState();
}

class _RegisterValidationState extends State<RegisterValidation> {
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Validation'),
        ),
        // two otp field 1 e mail and 1 phone number
        body: OtpPage(
            'Didn’t receive code?',
            'Resend',
            'Verification',
            "Code sent. Please enter the code.",
            FilledRoundedPinPut(
              length: 6,
              onCompleted: (p0) {
                registerController.validate_register();
              },
            ))
        // phone number
        // otp field
        // submit button
        );
  }
}

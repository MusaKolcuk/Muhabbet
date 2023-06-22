// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/register_controller.dart';

class OtpPage extends StatefulWidget {
  String? question;
  String? resend;
  String verification;
  String enterCode;
  final Widget pinPut;

  OtpPage(
    this.question,
    this.resend,
    this.verification,
    this.enterCode,
    this.pinPut, {
    Key? key,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();

  @override
  String toStringShort() => pinPut.toStringShort();
}

class _OtpPageState extends State<OtpPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
      child: Column(
        children: [
          OtpHeader(
            enterCode: widget.enterCode,
            verification: widget.verification,
          ),
          widget.pinPut,
          const SizedBox(height: 44),
          Text(
            widget.question!,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color.fromRGBO(62, 116, 165, 1),
            ),
          ),
          Text(
            widget.resend!,
            style: GoogleFonts.poppins(
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: const Color.fromRGBO(62, 116, 165, 1),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class OtpHeader extends StatefulWidget {
  String verification;
  String enterCode;

  OtpHeader({
    Key? key,
    required this.verification,
    required this.enterCode,
  }) : super(key: key);

  @override
  State<OtpHeader> createState() => _OtpHeaderState();
}

class _OtpHeaderState extends State<OtpHeader> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.verification,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          widget.enterCode,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromRGBO(133, 153, 170, 1),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          registerController.emailController.text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}

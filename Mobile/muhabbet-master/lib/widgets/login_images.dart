// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginImages extends StatelessWidget {
  String text;
  String imageAsset;
  LoginImages({
    Key? key,
    required this.text,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: h * 0.05,
        ),
        Image.asset(
          imageAsset,
          width: w * 0.65,
          height: w * 0.65,
        ),
        SizedBox(
          height: h * 0.02,
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Text(text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        SizedBox(
          height: h * 0.02,
        ),
      ],
    );
  }
}

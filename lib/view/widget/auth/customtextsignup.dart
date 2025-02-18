import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function()? onTap;

  const CustomTextSignUpOrSignIn(
      {super.key, required this.textOne, required this.textTwo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$textOne ",
          textAlign: TextAlign.end,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            " $textTwo",
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

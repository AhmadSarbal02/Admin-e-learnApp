import 'package:flutter/material.dart';

class CustomCardAdmin extends StatelessWidget {
  final String name;
  final String url;
  final void Function()? onTap;
  const CustomCardAdmin({
    super.key,
    required this.onTap,
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            url,
            width: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name),
        ]),
      ),
    );
  }
}

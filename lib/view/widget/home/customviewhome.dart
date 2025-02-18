import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/home/cstometitlehome.dart';
import 'package:flutter/material.dart';

class CustomViewHome extends StatelessWidget {
  final String name;
  const CustomViewHome({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Stack(children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text("$name (Admin) ",
                    style: const TextStyle(color: Colors.white, fontSize: 30)),
                subtitle: const Text(
                    "Manage your app                                    add categories and courses",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: AppColor.secoundColor,
                    borderRadius: BorderRadius.circular(160)),
              ),
            )
          ]),
        ),
      ],
    );
  }
}

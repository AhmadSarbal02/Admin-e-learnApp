import 'package:admin/controller/categories/addcategorise_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';

import 'package:admin/core/function/validinput.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/core/shared/customtextformapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Categories'),
      ),
      body: GetBuilder<CategoriesAddController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        CustomTextFormApp(
                            hinttext: "Enter Category Name ",
                            labeltext: "Category Name",
                            icondata: Icons.category,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false,
                            obscureText: false),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            onPressed: () {
                              controller.chooseImage();
                            },
                            color: const Color.fromARGB(255, 4, 4, 102),
                            child: const Text(
                              " Choose Category Image",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        if (controller.file != null)
                          SizedBox(
                              height: 400,
                              child: SvgPicture.file(controller.file!)),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButtonAuth(
                            text: "Add",
                            onPressed: () {
                              controller.addData();
                            }),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

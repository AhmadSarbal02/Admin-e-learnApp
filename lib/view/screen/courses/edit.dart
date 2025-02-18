import 'package:admin/controller/courses/editcourses_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';

import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/customdropdownlist.dart';
import 'package:admin/view/widget/auth/custombuttonauth.dart';
import 'package:admin/core/shared/customtextformapp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoursesEdit extends StatelessWidget {
  const CoursesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CoursesEditController controller = Get.put(CoursesEditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Courses'),
      ),
      body: GetBuilder<CoursesEditController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        CustomTextFormApp(
                            hinttext: "Enter Courses Name ",
                            labeltext: "Courses Name",
                            icondata: Icons.category_outlined,
                            mycontroller: controller.name,
                            valid: (val) {
                              return validInput(val!, 1, 30, "");
                            },
                            isNumber: false,
                            obscureText: false),
                        CustomTextFormApp(
                            hinttext: "Enter Courses Details ",
                            labeltext: "Courses Details",
                            icondata: Icons.info_outline,
                            mycontroller: controller.details,
                            valid: (val) {
                              return validInput(val!, 1, 3000, "");
                            },
                            isNumber: false,
                            obscureText: false),
                        CustomTextFormApp(
                            hinttext: "Enter Courses Desc ",
                            labeltext: "Courses Desc",
                            icondata: Icons.description_outlined,
                            mycontroller: controller.desc,
                            valid: (val) {
                              return validInput(val!, 1, 2000, "");
                            },
                            isNumber: false,
                            obscureText: false),
                        CustomDropDownSearch(
                          listdata: controller.dropdownList,
                          title: "Chosse Category",
                          dropdownSelectedName: controller.catName!,
                          dropdownSelectedID: controller.catid!,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: Column(
                            children: [
                              const Text("Courses For You"),
                              RadioListTile(
                                  title: const Text("Hidden"),
                                  value: "0",
                                  groupValue: controller.active,
                                  onChanged: (val) {
                                    controller.changeStatusActive(val);
                                  }),
                              RadioListTile(
                                  title: const Text("Show"),
                                  value: "1",
                                  groupValue: controller.active,
                                  onChanged: (val) {
                                    controller.changeStatusActive(val);
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            onPressed: () {
                              controller.chooseImage();
                            },
                            color: const Color.fromARGB(255, 4, 4, 102),
                            child: const Text(
                              " Choose Courses Image",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (controller.file != null)
                          SizedBox(
                              height: 400,
                              child: Image.file(
                                controller.file!,
                                height: 300,
                                width: 300,
                              )),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButtonAuth(
                            text: "Save",
                            onPressed: () {
                              controller.editData();
                            }),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

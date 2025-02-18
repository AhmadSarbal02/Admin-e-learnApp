import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/usersdata.dart';

import 'package:admin/data/model/Usersmodel.dart';
import 'package:get/get.dart';

class UsersViewController extends GetxController {
  UsersData usersData = UsersData(Get.find());
  List<UsersModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.getData();
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(
    String id,
  ) async {
    await usersData.delete({
      'id': id,
    });

    data.removeWhere((element) => element.usersId.toString() == id);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAndToNamed(AppRoute.home);
    return Future.value(false);
  }
}

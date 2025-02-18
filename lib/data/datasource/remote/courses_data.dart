import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class CoursesData {
  Crud crud;

  CoursesData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.coursesView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.coursesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.coursesDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.coursesEdie, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.coursesEdie, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }
}

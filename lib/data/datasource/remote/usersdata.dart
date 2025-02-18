import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class UsersData {
  Crud crud;

  UsersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.usersView, {});
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.usersDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}

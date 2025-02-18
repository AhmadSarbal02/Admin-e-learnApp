import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/middleware/mymiddleware.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/courses/add.dart';
import 'package:admin/view/screen/courses/edit.dart';
import 'package:admin/view/screen/courses/view.dart';

import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/users/view.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/", page: () => const Login(),
    //  middlewares: [
    //   MyMiddleWare(),
    // ]
  ),

//Home
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  //// Categories
  GetPage(name: AppRoute.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesEdit, page: () => const CategoriesEdit()),
  // GetPage(name: AppRoute.settings, page: () => const Settings()),

  //// Courses
  GetPage(name: AppRoute.coursesView, page: () => const CoursesView()),
  GetPage(name: AppRoute.coursesAdd, page: () => const CoursesAdd()),
  GetPage(name: AppRoute.coursesEdit, page: () => const CoursesEdit()),

  ///users
  GetPage(name: AppRoute.usersView, page: () => const UsersView()),
];

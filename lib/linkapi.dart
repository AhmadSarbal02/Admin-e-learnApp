class AppLink {
  static const String server = "https://sarbal2.online/elearn/admin";
  static const String imageststatic = "https://sarbal2.online/elearn/upload";

  //====================     image     =================== //

  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestCourses = "$imageststatic/courses";
  //======================================================== //
  static const String test = "$server/test.php";

  //====================     Auth      =================== //

  static const String login = "$server/auth/login.php";

  ///categories
  static const String categoriesAdd = "$server/categories/add.php";
  static const String categoriesEdie = "$server/categories/edit.php";
  static const String categoriesView = "$server/categories/view.php";
  static const String categoriesDelete = "$server/categories/delete.php";

  //Courses
  static const String coursesAdd = "$server/courses/add.php";
  static const String coursesEdie = "$server/courses/edit.php";
  static const String coursesView = "$server/courses/view.php";
  static const String coursesDelete = "$server/courses/delete.php";

  //Users
  static const String usersView = "$server/users/view.php";
  static const String usersDelete = "$server/users/delete.php";
}

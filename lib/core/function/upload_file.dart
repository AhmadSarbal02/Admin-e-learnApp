import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Future<bool> checkFileAccessPermission(context) async {
//   var status = await Permission.storage.status;
//   if (!status.isGranted) {
//     if (await Permission.storage.request().isGranted) {
//       return true;
//       // الوصول إلى الملفات تمت الموافقة عليه
//       // هنا يمكنك استخدام مكتبة file_picker
//     } else {
//      await requestFileAccessPermission(context);
//      await checkFileAccessPermission(context);
//       // تم رفض الوصول إلى الملفات
//       // يمكنك اتخاذ إجراء مناسب، مثل عرض رسالة للمستخدم لطلب الوصول
//     }
//   } else {
//    await requestFileAccessPermission(context);
//    await checkFileAccessPermission(context);
//     // الوصول إلى الملفات مسموح به بالفعل
//     // هنا يمكنك استخدام مكتبة file_picker
//   }
//   return false;
// }

//  requestFileAccessPermission(context) async {
//   var status = await Permission.storage.request();
//   if (status.isGranted) {
//     // تمت الموافقة على الوصول إلى ملفات الجهاز
//     // يمكنك تنفيذ الإجراءات المطلوبة هنا
//   } else if (status.isDenied) {
//     // تم رفض الوصول إلى ملفات الجهاز
//     // يمكنك عرض رسالة للمستخدم لطلب الوصول
//     await openAppSettings(); // فتح إعدادات التطبيق للمستخدم
//   } else if (status.isPermanentlyDenied) {
//     // تم رفض الوصول بشكل دائم إلى ملفات الجهاز
//     // يمكنك عرض رسالة للمستخدم وتوجيهه لتفعيل الوصول من إعدادات الجهاز
//     // على سبيل المثال:
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('إذن الوصول'),
//         content: Text(
//             'يجب عليك تفعيل إذن الوصول إلى ملفات الجهاز من إعدادات الجهاز.'),
//         actions: [
//           ActionChip(
//             label: Text('إعدادات'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               openAppSettings();
//             },
//           ),
//           ActionChip(
//             label: Text('إلغاء'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

imageUploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSVG = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSVG
        ? [
            'svg',
            'SVG',
          ]
        : [
            'png',
            'PNG',
            'jpg',
            'JPG',
            'gif',
            'GIF',
          ],
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

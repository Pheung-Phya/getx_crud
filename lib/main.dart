import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_crud/app1/controllers/theme_controller.dart';
import 'package:getx_crud/app3/controllers/translate_controller.dart';
import 'package:getx_crud/app3/pages/home_page.dart';
import 'package:getx_crud/app3/translate/translation.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TranslateController translateController =
      Get.put(TranslateController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          translations: Translation(),
          locale: translateController.currentLocale.value,
          fallbackLocale: const Locale('en'),
          theme: ThemeData.light(),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          home: HomePage(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslateController extends GetxController {
  final storage = GetStorage();
  Rx<Locale> currentLocale = const Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    String? change = storage.read('language');
    if (change != null) {
      currentLocale.value = Locale(change);
    }
  }

  void changeLanguage() {
    String newLang = currentLocale.value.languageCode == "en" ? "kh" : "en";

    currentLocale.value = Locale(newLang);
    storage.write('language', newLang);
    Get.updateLocale(currentLocale.value);
    update();
  }
}

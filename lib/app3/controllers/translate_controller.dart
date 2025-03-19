import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  var currentLocale = const Locale('en').obs;

  void changeLanguage() {
    if (currentLocale.value.languageCode == 'kh') {
      currentLocale.value = const Locale('en');
    } else {
      currentLocale.value = const Locale('kh');
    }
    Get.updateLocale(currentLocale.value);
  }
}

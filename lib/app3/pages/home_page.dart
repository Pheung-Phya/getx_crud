import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/app3/controllers/translate_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  TranslateController translateController = Get.find<TranslateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Hello'.tr),
              Text('world'.tr),
              Text('how are you to day?'.tr),
              ElevatedButton(
                  onPressed: translateController.changeLanguage,
                  child: const Text('Change Language'))
            ],
          ),
        ));
  }
}

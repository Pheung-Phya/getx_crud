import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/app/controller/user_controller.dart';
import 'package:getx_crud/app/pages/user_input_page.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});

  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        actions: [
          IconButton(
              icon: Icon(Icons.add), onPressed: () => Get.to(UserInputPage())),
        ],
      ),
    );
  }
}

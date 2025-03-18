import 'dart:io';
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
          title: const Text('User Page'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => Get.to(UserInputPage())),
          ],
        ),
        body: Obx(
          () => ListView.builder(
              itemCount: controller.userController.length,
              itemBuilder: (context, index) {
                final user = controller.userController[index];
                return InkWell(
                  onTap: () {
                    controller.edit(index);
                    Get.to(UserInputPage());
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Center(
                          child: Text('${user.id}'),
                        ),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.gender),
                      trailing: index == 0 || index == 1
                          ? Image.asset(
                              user.profile,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(
                                user.profile,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }),
        ));
  }
}

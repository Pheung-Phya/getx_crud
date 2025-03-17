import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/app/controller/user_controller.dart';
import 'package:image_picker/image_picker.dart';

class UserInputPage extends StatelessWidget {
  UserInputPage({super.key});

  final controller = Get.find<UserController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Input'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => controller.pickImage(ImageSource.gallery),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.pink,
                      child: Obx(
                        () => controller.profile.value != null
                            ? Image.file(File(controller.profile.value!),
                                fit: BoxFit.cover)
                            : const Center(child: Text('Tap to pick an image')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.isNumericOnly ||
                          value.length < 4) {
                        return 'User ID is required and is only number';
                      }
                      return null;
                    },
                    controller: controller.controllerId,
                    decoration: const InputDecoration(
                        hintText: 'Enter User ID',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'User Name is required';
                      }

                      return null;
                    },
                    controller: controller.controllerName,
                    decoration: const InputDecoration(
                        hintText: 'Enter User Name',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if ((value == null ||
                              value.isEmpty ||
                              value.toLowerCase() != "male") &&
                          value!.toLowerCase() != "female") {
                        return 'User Gender is required';
                      }
                      return null;
                    },
                    controller: controller.controllerGender,
                    decoration: const InputDecoration(
                        hintText: 'Enter User Gender',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.addUser();
                              }
                            },
                            child: const Text('Create User')),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}

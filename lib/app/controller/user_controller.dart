import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/app/model/user.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  final userController = [].obs;
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  var profile = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    userController.value = [
      User(
          id: 1001,
          name: "Tola",
          gender: "Male",
          profile: "assets/profile/redbull.jpg"),
      User(
          id: 1002,
          name: "Thida",
          gender: "Female",
          profile: "assets/profile/boostrong.jpg")
    ];
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profile.value = pickedFile.path;
    }
  }
}

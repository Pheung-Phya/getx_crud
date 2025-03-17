import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/app/model/user.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  final RxList<User> userController = <User>[].obs;
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  var profile = RxnString();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    userController.assignAll([
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
    ]);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        profile.value = pickedFile.path;
      } else {
        Get.snackbar("Image Picker", "No image selected",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick an image",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

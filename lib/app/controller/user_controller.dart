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
  User? user;
  int? editIndex;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  @override
  void onClose() {
    clear();
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

  void clear() {
    controllerId.clear();
    controllerName.clear();
    controllerGender.clear();
    profile.value = null;
    user = null;
    editIndex = null;
  }

  void edit(int index) {
    editIndex = index;
    user = userController[index];
    controllerId.text = user!.id.toString();
    controllerName.text = user!.name;
    controllerGender.text = user!.gender;
    profile.value = user!.profile;
  }

  void userUpdate() {
    if (editIndex != null) {
      userController[editIndex!] = User(
        id: int.parse(controllerId.text),
        name: controllerName.text,
        gender: controllerGender.text,
        profile: profile.string,
      );
      Get.snackbar("User", "User updated successfully");
    }
    clear();
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

  void addUser() {
    try {
      userController.add(User(
        id: int.parse(controllerId.text),
        name: controllerName.text,
        gender: controllerGender.text,
        profile: profile.string,
      ));

      clear();
      userController.refresh();
      Get.snackbar("User", "User added successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to add user",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void deleteUser(int index) {
    userController.removeAt(index);
    Get.snackbar("User Deleted", "User has been removed");
  }
}

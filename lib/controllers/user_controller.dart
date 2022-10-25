import 'package:flutterapp01/models/user_model.dart';
import 'package:flutterapp01/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var response =
          await RemoteService.getReq("https://6358344dc27556d28939aed4.mockapi.io/api/userList");
      var users = userFromJson(response);
      if (users != null) {
        userList.value = users;
        print(userList);
        isLoading(false);
      } else {
        print("response null!");
      }
    } catch (err) {
      print(err);
    } finally {
      isLoading(false);
    }
  }
}

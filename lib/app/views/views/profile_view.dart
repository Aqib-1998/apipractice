import 'package:api_integration/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends GetView {
  SignInController signInController = Get.find<SignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Text("Name: "),
            trailing: Text(signInController.currentUser.name),
          ),
          ListTile(
            leading: Text("UserName: "),
            trailing: Text(signInController.currentUser.username),
          ),
          ListTile(
            leading: Text("Address: "),
            trailing: Text(signInController.currentUser.address.street +
                " " +
                signInController.currentUser.address.suite +
                " " +
                signInController.currentUser.address.city),
          ),
          ListTile(
            leading: Text("Zip code: "),
            trailing: Text(signInController.currentUser.address.zipcode),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:api_integration/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userNamecontroller = TextEditingController();
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (c) {
        return Scaffold(
          body: FutureBuilder<List<UserModel>>(
              future: c.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: userNamecontroller,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          try {
                            UserModel currentUser = snapshot.data!.firstWhere(
                                (element) =>
                                    element.username ==
                                    userNamecontroller.text);
                            c.setCurrentUser(userModel: currentUser);
                            log(c.currentUser.toString());
                            Get.to(() => HomeView());
                          } catch (e) {
                            log(e.toString());
                            Get.snackbar("Error", e.toString(),
                                backgroundColor: Colors.red);
                          }
                        },
                        child: const Text("Sign in"))
                  ],
                );
              }),
        );
      },
    );
  }
}

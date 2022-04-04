import 'package:api_integration/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:api_integration/app/views/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/data_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  SignInController signInController = Get.find<SignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () =>
                  Get.to(() => ProfileView(), transition: Transition.downToUp),
              child: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ))
        ],
        title: const Text(
          "Api practice",
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return FutureBuilder<List<DataModel>>(
              future: controller.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
                List<DataModel> data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: Center(
                        child: Text(data[index].id.toString()),
                      )),
                      title: Text(
                        data[index].title,
                        style: TextStyle(
                            color: data[index].userId ==
                                    signInController.currentUser.id
                                ? Colors.blue
                                : Colors.black),
                      ),
                      subtitle: Text(data[index].body),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}

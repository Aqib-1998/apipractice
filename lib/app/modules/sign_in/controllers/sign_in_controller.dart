import 'package:api_integration/app/models/user_model.dart';
import 'package:api_integration/app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class SignInController extends GetxController {
  //TODO: Implement SignInController

  final count = 0.obs;
  late UserModel currentUser;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  UserModel setCurrentUser({required UserModel userModel}) {
    currentUser = userModel;
    return currentUser;
  }

  Future<List<UserModel>> getUserData() async {
    Response response;
    Dio dio = Dio();
    response = await dio.get(ApiService.baseAPi + ApiService.usersApi);
    late List<UserModel> _userData = [];
    List<dynamic> dataFromApi = response.data;
    for (int i = 0; i < dataFromApi.length; i++) {
      _userData.add(UserModel.fromMap(dataFromApi[i]));
    }
    List<UserModel> userData = _userData;
    return userData;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

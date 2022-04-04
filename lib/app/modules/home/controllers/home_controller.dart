import 'package:api_integration/app/models/data_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
   Future<List<DataModel>> getData() async {
    Response response;
    Dio dio = Dio();
    response = await dio.get("https://jsonplaceholder.typicode.com/posts");

    List<dynamic> dataFromApi = response.data;
    late List<DataModel> _items= [];
    for (int i = 0; i < dataFromApi.length; i++) {
      _items.add(DataModel.fromMap(dataFromApi[i]));
    }
    return _items;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

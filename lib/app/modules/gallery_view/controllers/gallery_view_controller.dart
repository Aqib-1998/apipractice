import 'package:api_integration/app/models/gallery_model.dart';
import 'package:api_integration/app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class GalleryViewController extends GetxController {
  Future<List<GalleryModel>> getGalleryData() async {
    Response response;
    Dio dio = Dio();
    response = await dio.get(ApiService.baseAPi + ApiService.galleryApi);
    List<dynamic> dataFromApi = response.data;
    late List<GalleryModel> _items = [];
    for (Map i in dataFromApi) {
      _items.add(GalleryModel.fromMap(i as Map<String, dynamic>));
    }
    return _items;
  }

  @override
  void onClose() {}
}

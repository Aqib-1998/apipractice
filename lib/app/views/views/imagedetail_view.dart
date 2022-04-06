import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:api_integration/app/models/gallery_model.dart';

class ImagedetailView extends GetView {
  List<GalleryModel> listOfImages;
  ImagedetailView({
    required this.listOfImages,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of gallery images'),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: listOfImages.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Image.network(listOfImages[index].thumbnailUrl),
                Text(listOfImages[index].id.toString())
              ],
            );
          }),
    );
  }
}

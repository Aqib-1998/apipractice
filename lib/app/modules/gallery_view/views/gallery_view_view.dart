import 'package:api_integration/app/models/gallery_model.dart';
import 'package:api_integration/app/views/views/imagedetail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gallery_view_controller.dart';

class GalleryViewView extends GetView<GalleryViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
      ),
      body: GetBuilder<GalleryViewController>(
        init: GalleryViewController(),
        builder: (controller) {
          return FutureBuilder<List<GalleryModel>>(
              future: controller.getGalleryData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<GalleryModel> dataList = snapshot.data!;
                late List<GalleryModel> albumOne = [],
                    albumTwo = [],
                    albumThree = [],
                    albumFour = [],
                    albumFive = [];
                List<List<GalleryModel>> listOfAlbums = [
                  albumOne,
                  albumTwo,
                  albumThree,
                  albumFour,
                  albumFive
                ];
                for (GalleryModel i in dataList) {
                  switch (i.albumId) {
                    case 1:
                      albumOne.add(i);
                      break;
                    case 2:
                      albumTwo.add(i);
                      break;
                    case 3:
                      albumThree.add(i);
                      break;
                    case 4:
                      albumFour.add(i);
                      break;
                    case 5:
                      albumFive.add(i);
                      break;
                  }
                }

                return ListView.builder(
                  itemCount: listOfAlbums.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width,
                      // height: Get.height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () => Get.to(ImagedetailView(
                                  listOfImages: listOfAlbums[index])),
                              child: Image.network(
                                  listOfAlbums[index][index].url)),
                          Text("Album ${index + 1}")
                        ],
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}

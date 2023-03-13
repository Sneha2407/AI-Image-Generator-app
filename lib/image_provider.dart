import 'package:ai_image_generator/models/data_model.dart';
import 'package:ai_image_generator/widgets/loader.dart';
import 'package:flutter/material.dart';

import 'models/api_model.dart';
import 'package:get/get.dart';

class ImageProv with ChangeNotifier {
  ImageModel imageModel = ImageModel();
  ImageModel get storeImageData => imageModel;

  Future createImage({
    required String title,
    required String size,
    required int number,
  }) async {
    CircularProgressIndicator(
      color: Color(0xffDEB988),
    );
    Map<String, dynamic> params = {};

    params["message"] = title;
    params["size"] = size;
    params["numberOfImages"] = number;

    var apiURL = "https://open-ai-image.codinghood.in/api/create-ai-image";
    var postResponse = await ApiModel.post(params, apiURL);

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    print("getting params ===>>> $params");
    print("           ======== ");

    print(" ========           ");

    if (postResponse['statuscode'] == 200) {
      //  showToast(postResponse['msg'].toString(), context);
      // Loader.hide();
      Get.snackbar(
        'Successful',
        // postResponse['msg'].toString(),
        "Created Images",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      // print(postResponse['msg']);

      notifyListeners();
    } else {
      //  showToast(postResponse['msg'].toString(), context);
      Loader.hide();
      Get.snackbar(
        'Error',
        // postResponse['msg'].toString(),
        "Oops! Try Again :(",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Color.fromARGB(190, 244, 67, 54),
      );
      notifyListeners();
    }

    notifyListeners();
  }
}

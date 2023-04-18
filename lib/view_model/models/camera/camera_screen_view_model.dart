import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreenViewModel {
  String title = AppTexts().cameraScreenTitle;
  List<String> guide = AppTexts().cameraScreenGuide;

  void capture(BuildContext context, CameraController controller, Function refreshState) async {
    Directory directory = await getApplicationDocumentsDirectory();

    if (controller.value.isInitialized) {
      await controller.takePicture().then((value) {
        String imagePath = "${directory.path}/${value.name}";
        value.saveTo(imagePath).then((_) => Navigator.pop(context, imagePath));
      });

      refreshState(() {});
    }
  }
}

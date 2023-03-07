import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/utilities/app_texts.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreenViewModel {
  String title = AppTexts().cameraScreenTitle;
  String guide1 = AppTexts().cameraScreenGuide1;
  String guide2 = AppTexts().cameraScreenGuide2;
  String guide3 = AppTexts().cameraScreenGuide3;
  String guide4 = AppTexts().cameraScreenGuide4;
  String guide5 = AppTexts().cameraScreenGuide5;

  void capture(BuildContext context, CameraController controller, Function refreshState) async {
    Directory directory = await getApplicationDocumentsDirectory();

    await controller.takePicture().then((value) {
      String imagePath = "${directory.path}/${value.name}";
      value.saveTo(imagePath).then((_) => Navigator.pop(context, imagePath));
    });

    refreshState(() {});
  }
}

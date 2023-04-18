import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/camera/camera_screen_view_model.dart';

class CameraScreen extends StatefulWidget {
  final String title;

  const CameraScreen({super.key, required this.title});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final rearCamera = cameras.first;
    _cameraController = CameraController(rearCamera, ResolutionPreset.medium, enableAudio: false);
    await _cameraController.initialize().then((value) {
      if (!mounted) return;
      _cameraController.setFlashMode(FlashMode.off);
      _cameraController.lockCaptureOrientation(DeviceOrientation.portraitUp);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: widget.title)),
      body: Padding(
        padding: EdgeInsets.all(Units().spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: CameraScreenViewModel().guide.map((text) {
                return Text(text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary));
              }).toList(),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary, strokeAlign: BorderSide.strokeAlignOutside),
                borderRadius: BorderRadius.circular(Units().borderRadius),
              ),
              child: AspectRatio(aspectRatio: 3 / 2, child: CameraPreview(_cameraController)),
            ),
            ButtonWidget(action: () => CameraScreenViewModel().capture(context, _cameraController, setState), label: "Capture", type: ButtonTypes.primary),
          ],
        ),
      ),
    );
  }
}

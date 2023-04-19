import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:lexa/utilities/show_modal.dart';
import 'package:lexa/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/widgets/button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ImageInputWidget extends StatefulWidget {
  final String label;
  final Function(String) onChange;

  const ImageInputWidget({super.key, required this.label, required this.onChange});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  String? _imagePath;

  void _imagePathChange(value) => setState(() => _imagePath = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModal(context, 'Capture Card', ModalBody(onChange: widget.onChange, imagePathChange: _imagePathChange)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_imagePath != null ? PhosphorIcons.fill.camera : PhosphorIcons.light.camera, color: _imagePath != null ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary, size: 24),
                SizedBox(width: Units().spacing / 2),
                Text(_imagePath != null ? "Card captured" : widget.label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: _imagePath != null ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary)),
              ],
            ),
            if (_imagePath != null) SizedBox(height: Units().spacing / 2),
            if (_imagePath != null) ImagePreview(imagePath: _imagePath),
          ],
        ),
      ),
    );
  }
}

class ImagePreview extends StatelessWidget {
  final String? _imagePath;

  const ImagePreview({super.key, required String? imagePath}) : _imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.tertiary, strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(Units().borderRadius),
      ),
      child: AspectRatio(aspectRatio: Units().cardAspectRatio, child: Image.file(File(_imagePath!), fit: BoxFit.fitWidth)),
    );
  }
}

class ModalBody extends StatefulWidget {
  final Function(String) onChange;
  final Function(String) imagePathChange;

  const ModalBody({super.key, required this.onChange, required this.imagePathChange});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
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

  void _capture() async {
    if (_cameraController.value.isInitialized) {
      Directory directory = await getApplicationDocumentsDirectory();
      await _cameraController.takePicture().then((image) {
        image.saveTo("${directory.path}/${image.name}");
        widget.onChange("${directory.path}/${image.name}");
        widget.imagePathChange("${directory.path}/${image.name}");
        Navigator.pop(context);
      });
    }
    setState(() {});
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.tertiary, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(Units().borderRadius),
          ),
          child: AspectRatio(aspectRatio: Units().cardAspectRatio, child: CameraPreview(_cameraController)),
        ),
        SizedBox(height: Units().spacing / 2),
        ButtonWidget(action: () => _capture(), label: "Capture", type: ButtonTypes.primary),
      ],
    );
  }
}

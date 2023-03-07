import 'dart:io';

import 'package:camera/camera.dart';
import 'package:lexa/view/camera/camera_screen.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ImageInputWidget extends StatefulWidget {
  final String label;
  final String? imagePath;
  final Function(String) onChange;

  const ImageInputWidget({super.key, required this.label, this.imagePath, required this.onChange});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await availableCameras().then((value) async {
          _imagePath = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(title: widget.label, camera: value.first)));
          widget.onChange(_imagePath!);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: mainUnit / 2, vertical: mainUnit - 8),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_imagePath != null ? PhosphorIcons.cameraFill : PhosphorIcons.camera, color: _imagePath != null ? colorPrimary : colorTertiary, size: 24),
                const SizedBox(width: mainUnit / 2),
                Text(_imagePath != null ? "Card captured" : widget.label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: _imagePath != null ? colorPrimary : colorTertiary)),
              ],
            ),
            if (_imagePath != null) const SizedBox(height: mainUnit / 2),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      child: AspectRatio(aspectRatio: 3 / 2, child: Image.file(File(_imagePath!), fit: BoxFit.fitWidth)),
    );
  }
}

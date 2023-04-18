import 'dart:io';

import 'package:lexa/view/camera/camera_screen.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _imagePath = await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(title: widget.label)));
        widget.onChange(_imagePath!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Units().spacing / 2, vertical: Units().spacing - 8),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_imagePath != null ? PhosphorIcons.cameraFill : PhosphorIcons.camera, color: _imagePath != null ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary, size: 24),
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
      child: AspectRatio(aspectRatio: 3 / 2, child: Image.file(File(_imagePath!), fit: BoxFit.fitWidth)),
    );
  }
}

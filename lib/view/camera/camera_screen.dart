import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexa/view_model/functions/show_modal.dart';
import 'package:lexa/view_model/widgets/button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:lexa/view_model/widgets/app_bar.dart';
import 'package:lexa/view_model/models/camera/camera_screen_view_model.dart';

class CameraScreen extends StatefulWidget {
  final String title;
  final CameraDescription? camera;

  const CameraScreen({super.key, required this.title, this.camera});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera!, ResolutionPreset.max, enableAudio: false);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});

      controller.setFlashMode(FlashMode.off);
      controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight), child: AppBarWidget(title: widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(mainUnit),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
                  child: CameraPreview(controller),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: ButtonWidget(action: () => CameraScreenViewModel().capture(context, controller, setState), label: "Capture", type: ButtonTypes.primary)),
                const SizedBox(width: mainUnit / 2),
                ButtonWidget(action: () => showModal(context, "Importnat notice", const ModalBody()), icon: PhosphorIcons.info, iconColor: colorPrimary, type: ButtonTypes.secondary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ModalBody extends StatefulWidget {
  const ModalBody({super.key});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(CameraScreenViewModel().guide1, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
        const SizedBox(height: mainUnit / 4),
        Text(CameraScreenViewModel().guide2, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
        const SizedBox(height: mainUnit / 4),
        Text(CameraScreenViewModel().guide3, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
        const SizedBox(height: mainUnit / 4),
        Text(CameraScreenViewModel().guide4, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
        const SizedBox(height: mainUnit / 4),
        Text(CameraScreenViewModel().guide5, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorTertiary)),
      ],
    );
  }
}

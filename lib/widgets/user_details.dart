import 'package:lexa/theme/constants.dart';
import 'package:lexa/widgets/button.dart';
import 'package:lexa/utilities/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserDetails extends StatefulWidget {
  final bool isPremium;

  const UserDetails({Key? key, this.isPremium = false}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String selectedImage = "3";

  void _imageChange(String newImage) {
    setState(() => selectedImage = newImage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => showModal(context, "Choose your avatar", ModalBody(changeImage: _imageChange)),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.tertiary, strokeAlign: BorderSide.strokeAlignOutside),
              borderRadius: BorderRadius.circular(240),
              image: DecorationImage(image: AssetImage('assets/images/avatars/$selectedImage.jpg'), fit: BoxFit.cover),
            ),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        SizedBox(width: Units().spacing / 2),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Saif Eldeen Essam", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
              Text('+20 155 823 7511', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
            ],
          ),
        ),
        ButtonWidget(
          action: () {},
          icon: widget.isPremium ? PhosphorIcons.fill.crown : PhosphorIcons.light.crownSimple,
          iconColor: widget.isPremium ? GlobalColors().pendding : Theme.of(context).colorScheme.tertiary,
          type: ButtonTypes.secondary,
        ),
      ],
    );
  }
}

class ModalBody extends StatelessWidget {
  final Function(String) changeImage;

  const ModalBody({super.key, required this.changeImage});

  @override
  Widget build(BuildContext context) {
    List<Widget> renderAvatars() {
      List<Widget> avatars = [];

      for (var i = 1; i <= 12; i++) {
        avatars.add(
          GestureDetector(
            onTap: () => changeImage(i.toString()),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary, strokeAlign: BorderSide.strokeAlignOutside),
                borderRadius: BorderRadius.circular(240),
                image: DecorationImage(image: AssetImage('assets/images/avatars/$i.jpg'), fit: BoxFit.cover),
              ),
              clipBehavior: Clip.hardEdge,
            ),
          ),
        );
      }

      return avatars;
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: Units().spacing,
      crossAxisSpacing: Units().spacing,
      physics: const BouncingScrollPhysics(),
      children: renderAvatars(),
    );
  }
}
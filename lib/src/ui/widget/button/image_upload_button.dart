import 'dart:io';

import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadButton extends HookWidget {
  const ImageUploadButton({
    super.key,
    this.radius = 8,
    this.width,
    this.height = 50,
    required this.onImageSelected,
  });

  final double radius;
  final double? width;
  final double height;
  final Function(File file) onImageSelected;

  @override
  Widget build(BuildContext context) {
    final image = useState<XFile?>(null);

    return InkWell(
      onTap: () {
        final ImagePicker picker = ImagePicker();

        picker.pickImage(source: ImageSource.gallery).then((value) {
          if (value != null) {
            image.value = value;
            onImageSelected(File(value.path));
          }
        });
      },
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width ?? double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              image.value != null
                  ? context.localization.re_upload_photo
                  : context.localization.upload_photo,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

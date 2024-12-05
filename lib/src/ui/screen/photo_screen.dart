import 'package:auto_route/annotations.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';

@RoutePage()
class PhotoScreen extends HookWidget {
  const PhotoScreen({super.key, required this.imageProvider,});

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.detail_view),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: imageProvider,
        ),
      ),
    );
  }
}

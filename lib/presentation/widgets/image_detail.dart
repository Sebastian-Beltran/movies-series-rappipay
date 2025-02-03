import 'package:flutter/material.dart';
import 'package:movies_series_app/core/constants/palette.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({required this.imgPath, super.key});

  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: imgPath != null
          ? Image.network(
              'https://images.tmdb.org/t/p/w1280/$imgPath',
              errorBuilder: (context, error, stackTrace) {
                return Text("Image not found");
              },
            )
          : Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.image_not_supported_rounded,
                color: Palette.white,
                size: 100,
              )),
    );
  }
}

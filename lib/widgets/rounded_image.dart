import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const double IMAGE_SIZE = 90;

class RoundedImageWidget extends StatelessWidget {
  final String imagePath;

  RoundedImageWidget({@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(IMAGE_SIZE / 2),
      child: CachedNetworkImage(
        width: IMAGE_SIZE,
        height: IMAGE_SIZE,
        imageUrl: imagePath ?? "",
        placeholder: (context, string) => Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, string, error) => Container(
          width: IMAGE_SIZE,
          height: IMAGE_SIZE,
          child: Center(
            child: Icon(
              Icons.error,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}

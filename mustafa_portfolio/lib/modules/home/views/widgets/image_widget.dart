import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.radius,
  });

  final String image;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? designRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: height,
        width: width,
        progressIndicatorBuilder: (_, __, downloadProgress) {
          return Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          );
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';

class ImageFrameWidget extends StatelessWidget {
  const ImageFrameWidget({
    required this.project,
    required this.size,
    super.key,
  });

  final Project project;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.height * 0.34,
      child: DeviceFrame(
        device: Devices.android.samsungGalaxyNote20,
        screen: CachedNetworkImage(
          imageUrl: project.images.first,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

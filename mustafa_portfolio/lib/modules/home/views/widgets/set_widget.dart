import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/image_widget.dart';

class SetWidget extends StatelessWidget {
  const SetWidget({
    required this.title,
    required this.onTap,
    this.description,
    this.image,
    this.icon,
    this.isIcon = false,
    super.key,
  });

  final String title;
  final String? description;
  final VoidCallback onTap;
  final String? image;
  final Icon? icon;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(designRadius),
        ),
        padding: EdgeInsets.all(designPaddingCenter),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: isIcon ? 54 : 75,
              width: isIcon ? 54 : 75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryColor,
                    AppColors.surfaceColor,
                  ],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(designRadius),
              ),
              child: isIcon ? icon : ImageWidget(image: image!),
            ),
            designPaddingCenter.pw,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  if (description != null) designPaddingCenter.ph,
                  if (description != null)
                    Text(
                      description!,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

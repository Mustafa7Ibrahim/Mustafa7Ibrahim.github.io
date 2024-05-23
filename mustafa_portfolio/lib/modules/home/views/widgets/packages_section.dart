import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/packages_model.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/title_icon_widget.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({super.key, required this.packages});

  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.12),
      child: Column(
        children: [
          TitleIconWidget(
            title: "My Packages",
            icon: "📦",
          ),
          designPadding.ph,
          Text(
            "Those are the packages that i have created for you to use in your projects",
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          designPadding.ph,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 4,
            ),
            itemCount: packages.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(designPadding),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(designRadius),
                ),
                child: Column(
                  children: [
                    Text(
                      packages[index].name,
                      style: context.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    designPadding.ph,
                    Text(
                      packages[index].description,
                      style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

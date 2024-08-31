import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/core/core_data/packages_model.dart';
import 'package:mustafa_portfolio/core/helpers/url_helper.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/section_container.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/set_widget.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({super.key, required this.packages});

  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      tileTitle: "My Packages",
      tileIcon: "📦",
      headerTitle: "Those are the packages that i have created.",
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: packages.length,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: designPaddingCenter,
          mainAxisSpacing: designPaddingCenter,
          childAspectRatio: 3.8,
        ),
        itemBuilder: (context, index) {
          return SetWidget(
            title: packages[index].name,
            description: packages[index].description,
            onTap: () => launchLink(packages[index].pubDevLink!),
            image: packages[index].logo,
          );
        },
      ),
    );
  }
}

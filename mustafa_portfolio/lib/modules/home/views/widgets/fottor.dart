import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/socials.dart';

/// footer
class Footer extends StatelessWidget {
  /// footer
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(designPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '© 2023 Mustafa Ibrahim All Rights Reserved',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const Spacer(),
          const FooterItem(title: 'Call', value: '+201116613745'),
          designPadding.pw,
          const FooterItem(
            title: 'Write',
            value: 'mustafa7ibrahim@gmail.com',
          ),
          designPadding.pw,
          Column(
            children: [
              const Text(
                'Follow',
              ),
              designPaddingCenter.ph,
              const Socials(isFooter: true),
            ],
          ),
          designPadding.ph,
        ],
      ),
      // : Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //           Expanded(
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text(
      //                   'Call',
      //                 ),
      //                 designPaddingCenter.ph,
      //                 const SelectableText(
      //                   '+201116613745\n',
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Expanded(
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text(
      //                   'Write',
      //                 ),
      //                 designPaddingCenter.ph,
      //                 const SelectableText(
      //                   'Mustafa7ibrahim@gmail.com',
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //       designPaddingCenter.ph,
      //       const Text(
      //         'Follow',
      //       ),
      //       designPaddingCenter.ph,
      //       const Socials(isFooter: true),
      //       designPadding.ph,
      //       const Text(
      //         '© 2023 Mustafa Ibrahim All Rights Reserved',
      //       ),
      //     ],
      //   ),
    );
  }
}

/// footer item
class FooterItem extends StatelessWidget {
  /// footer item
  const FooterItem({
    required this.title,
    required this.value,
    super.key,
  });

  /// footer item title
  final String title;

  /// footer item value
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
        ),
        designPaddingCenter.ph,
        SelectableText(
          value,
        ),
      ],
    );
  }
}

import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/socials.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// footer
class Footer extends StatelessWidget {
  /// footer
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(designPadding),
      child: ResponsiveBreakpoints.of(context).isDesktop
          ? Row(
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
                    Text(
                      'Follow',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    designPaddingCenter.ph,
                    const Socials(isFooter: true),
                  ],
                ),
                designPadding.ph,
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          designPaddingCenter.ph,
                          Text(
                            '+201116613745\n',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Write',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          designPaddingCenter.ph,
                          Text(
                            'Mustafa7ibrahim@gmail.com',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                designPaddingCenter.ph,
                Text(
                  'Follow',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                designPaddingCenter.ph,
                const Socials(isFooter: true),
                designPadding.ph,
                Text(
                  '© 2023 Mustafa Ibrahim All Rights Reserved',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
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
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        designPaddingCenter.ph,
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}

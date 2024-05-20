import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/fottor.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/my_info.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/my_info_text.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// home view for the app
class HomeView extends HookWidget {
  /// home view for the app
  const HomeView({required this.tabController, super.key});

  /// tab controller
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state.status == PortfolioStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final me = state.aboutMe;
          return ListView(
            children: [
              if (ResponsiveBreakpoints.of(context).isDesktop)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(44),
                      constraints: BoxConstraints(
                        minHeight: size.height,
                        minWidth: size.width,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          MyInfo(
                            tabController: tabController,
                            aboutMe: me!,
                          ),
                          34.pw,
                          MyInfoText(
                            tabController: tabController,
                            aboutMe: me,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Footer(),
                  ],
                )
              else
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minHeight: size.height,
                        minWidth: size.width,
                      ),
                      margin: const EdgeInsets.all(44),
                      child: Column(
                        children: [
                          MyInfo(
                            tabController: tabController,
                            aboutMe: me!,
                          ),
                          34.ph,
                          MyInfoText(
                            tabController: tabController,
                            aboutMe: me,
                          ),
                        ],
                      ),
                    ),
                    const Footer(),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

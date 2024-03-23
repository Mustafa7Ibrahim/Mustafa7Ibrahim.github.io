import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/articles/views/articles_screen.dart';
import 'package:mustafa_portfolio/modules/home/views/home.dart';
import 'package:mustafa_portfolio/modules/projects/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/projects/views/projects_screen.dart';
import 'package:mustafa_portfolio/modules/resume/views/resume_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

///
class Wrapper extends HookWidget {
  ///
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 4);

    final pages = useMemoized(() {
      return [
        HomeView(tabController: controller),
        const ResumeScreen(),
        const ProjectsScreen(),
        const ArticlesScreen(),
      ];
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SafeArea(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'IX',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueColor,
                                ),
                          ),
                          designPaddingCenter.pw,
                          Text(
                            'Mustafa Ibrahim',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'Senior Flutter Developer',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                if (ResponsiveBreakpoints.of(context).isDesktop)
                  SizedBox(
                    width: 420,
                    child: TabBar(
                      isScrollable: true,
                      controller: controller,
                      indicatorColor: Colors.transparent,
                      onTap: controller.animateTo,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'ABOUT ME'),
                        Tab(text: 'RESUME'),
                        Tab(text: 'PROJECTS'),
                        Tab(text: 'ARTICLES'),
                        // Tab(text: 'CONTACT'),
                      ],
                    ),
                  )
                else
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(designRadius),
                    ),
                    icon: const Icon(Icons.menu),
                    onSelected: controller.animateTo,
                    itemBuilder: (context) {
                      return const [
                        PopupMenuItem(
                          value: 0,
                          child: Text('ABOUT ME'),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Text('RESUME'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('PROJECTS'),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text('ARTICLES'),
                        ),
                        // PopupMenuItem(
                        //   value: 4,
                        //   child: Text('CONTACT'),
                        // ),
                      ];
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => PortfolioBloc()..add(const LoadPortfolioEvent()),
        child: SafeArea(
          child: TabBarView(
            controller: controller,
            children: pages,
          ),
        ),
      ),
    );
  }
}

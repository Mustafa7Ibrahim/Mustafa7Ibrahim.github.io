import 'dart:ui';

import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';
import 'package:mustafa_portfolio/modules/home/views/components/articles_section.dart';
import 'package:mustafa_portfolio/modules/home/views/components/projects_section.dart';
import 'package:mustafa_portfolio/modules/home/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/home/views/components/packages_section.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/resume_screen.dart';

///
class HomeWrapper extends HookWidget {
  ///
  const HomeWrapper({super.key});

  void goToWidgetByTag(GlobalKey key) {
    final renderObject = key.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      renderObject.localToGlobal(Offset.zero);
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeKey = useMemoized(() => GlobalKey());
    final projectsKey = useMemoized(() => GlobalKey());
    final aboutMeKey = useMemoized(() => GlobalKey());
    final packagesKay = useMemoized(() => GlobalKey());
    final articlesKey = useMemoized(() => GlobalKey());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: designPadding,
                vertical: designPaddingCenter,
              ),
              decoration: new BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => goToWidgetByTag(homeKey),
                    child: Text(
                      'Mustafa Ibrahim',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      goToWidgetByTag(projectsKey);
                    },
                    child: const Text('Work'),
                  ),
                  designPaddingCenter.pw,
                  TextButton(
                    onPressed: () {
                      goToWidgetByTag(packagesKay);
                    },
                    child: const Text('Packages'),
                  ),
                  designPaddingCenter.pw,
                  TextButton(
                    onPressed: () {},
                    child: const Text('Skills'),
                  ),
                  designPaddingCenter.pw,
                  TextButton(
                    onPressed: () {
                      goToWidgetByTag(articlesKey);
                    },
                    child: const Text('Blog'),
                  ),
                  designPaddingCenter.pw,
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Contact'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: designPadding,
                        vertical: designPadding20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => PortfolioBloc()..add(const LoadPortfolioEvent()),
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            if (state.status == PortfolioStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProjectsSection(
                    key: homeKey,
                    projectsKey: projectsKey,
                    projects: state.projects,
                    onTapWork: () => goToWidgetByTag(projectsKey),
                    onTapAbout: () => goToWidgetByTag(aboutMeKey),
                  ),
                  PackagesSection(
                    key: packagesKay,
                    packages: state.packages,
                  ),
                  ResumeScreen(
                    key: aboutMeKey,
                    state: state,
                  ),
                  ArticlesScreen(
                    key: articlesKey,
                    articles: state.articles,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

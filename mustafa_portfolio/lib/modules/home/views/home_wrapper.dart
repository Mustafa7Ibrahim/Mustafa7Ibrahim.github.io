import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/responsive/responsive_layouts.dart';
import 'package:mustafa_portfolio/modules/home/bloc/portfolio_bloc.dart';
import 'package:mustafa_portfolio/modules/home/views/home_wrapper_compact.dart';
import 'package:mustafa_portfolio/modules/home/views/home_wrapper_medium.dart';
import 'package:mustafa_portfolio/modules/home/views/widgets/web_nav.dart';

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
    final experienceKey = useMemoized(() => GlobalKey());
    final projectsKey = useMemoized(() => GlobalKey());
    final packagesKay = useMemoized(() => GlobalKey());
    final blogKey = useMemoized(() => GlobalKey());
    final skillsKey = useMemoized(() => GlobalKey());
    final aboutMeKey = useMemoized(() => GlobalKey());

    return BlocProvider(
      create: (context) => PortfolioBloc()..add(const LoadPortfolioEvent()),
      child: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state.status == PortfolioStatus.loading) {
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: WebNavBar(
                experienceKey: experienceKey,
                projectsKey: projectsKey,
                packagesKay: packagesKay,
                articlesKey: blogKey,
                skillsKey: skillsKey,
                goToWidgetByTag: goToWidgetByTag,
              ),
            ),
            body: WindowClassLayout(
              compact: (context) => HomeWrapperCompact(
                experienceKey: experienceKey,
                projectsKey: projectsKey,
                packagesKay: packagesKay,
                blogKey: blogKey,
                skillsKey: skillsKey,
                aboutMeKey: aboutMeKey,
                goToWidgetByTag: goToWidgetByTag,
                state: state,
                windowSizeResponsive: WindowSizeResponsive.compact,
              ),
              medium: (context) => HomeWrapperMedium(
                experienceKey: experienceKey,
                projectsKey: projectsKey,
                packagesKay: packagesKay,
                blogKey: blogKey,
                skillsKey: skillsKey,
                aboutMeKey: aboutMeKey,
                goToWidgetByTag: goToWidgetByTag,
                state: state,
                windowSizeResponsive: WindowSizeResponsive.medium,
              ),
              // expanded: (context) => HomeWrapperExpanded(
              //   experienceKey: experienceKey,
              //   projectsKey: projectsKey,
              //   packagesKay: packagesKay,
              //   blogKey: blogKey,
              //   skillsKey: skillsKey,
              //   aboutMeKey: aboutMeKey,
              //   goToWidgetByTag: goToWidgetByTag,
              //   state: state,
              // ),
            ),
          );
        },
      ),
    );
  }
}

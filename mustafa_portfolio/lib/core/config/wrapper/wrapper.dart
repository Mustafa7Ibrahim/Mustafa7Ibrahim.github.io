import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mustafa_portfolio/modules/home/views/home.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

///
class Wrapper extends HookWidget {
  ///
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 5);

    final pages = useMemoized(() {
      return [
        const HomeView(),
        const Center(child: Text('RESUME')),
        const Center(child: Text('PROJECTS')),
        const Center(child: Text('BLOG')),
        const Center(child: Text('CONTACT')),
      ];
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: ResponsiveBreakpoints.of(context).isDesktop ? 300 : 150,
                child: Text(
                  'MUSTAFAIX',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
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
                      Tab(text: 'BLOG'),
                      Tab(text: 'CONTACT'),
                    ],
                  ),
                )
              else
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa_portfolio/core/bloc/bloc_observer.dart';
import 'package:mustafa_portfolio/core/config/routes/route_config.dart';
import 'package:mustafa_portfolio/core/config/theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mhftedonkcimndfxziwl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1oZnRlZG9ua2NpbW5kZnh6aXdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYxNDU5MTMsImV4cCI6MjAzMTcyMTkxM30.u0jmrrxo_9hAWpGDflNDCQ3QB1llHtNK7T2v-W3N31Q',
  );
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  /// This Widget is the main application widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mustafa Ibrahim',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RouteConfig.router,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
          ],
        );
      },
    );
  }
}

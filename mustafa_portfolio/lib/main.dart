import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mustafa_portfolio/core/bloc/bloc_observer.dart';
import 'package:mustafa_portfolio/core/config/routes/route_config.dart';
import 'package:mustafa_portfolio/core/config/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Mustafa IX',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RouteConfig.router,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}

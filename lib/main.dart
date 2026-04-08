import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/routes/route_generator.dart';
import 'package:syria_glow/core/theme/app_theme.dart';
import 'package:syria_glow/generated/l10n.dart';

void main() {
  runApp(const SyriaGlow());
}

class SyriaGlow extends StatelessWidget {
  const SyriaGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syria Glow',
      theme: AppTheme.mainTheme,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: AppRoutes.splashView,
      debugShowCheckedModeBanner: false,
      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale:const Locale('ar'),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/manager/localization_cubit/language_cubit.dart';
import 'package:syria_glow/core/manager/localization_cubit/language_state.dart';
import 'package:syria_glow/core/routes/app_routes.dart';
import 'package:syria_glow/core/routes/route_generator.dart';
import 'package:syria_glow/core/services/notification_service.dart';
import 'package:syria_glow/core/theme/app_theme.dart';
import 'package:syria_glow/firebase_options.dart';
import 'package:syria_glow/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
 await setupServiceLocator();
  await sl.get<NotificationService>().initNotifications();
  runApp(
    BlocProvider(
      create: (context) => LanguageCubit(),
      child: const SyriaGlow(),
    ),
  );
}

class SyriaGlow extends StatelessWidget {
  const SyriaGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Syria Glow',
              theme: AppTheme.mainTheme,
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              initialRoute: AppRoutes.splashView,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: state.locale,
              builder: (context, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeInOut,
                  key: ValueKey<String>(state.locale.languageCode),
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}

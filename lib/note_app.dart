import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/routing/app_routers.dart';
import 'package:to_do/core/routing/routes.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/generated/l10n.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Note App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PT Sans',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

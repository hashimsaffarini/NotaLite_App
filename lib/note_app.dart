import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/routing/app_routers.dart';
import 'package:to_do/core/routing/routes.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/generated/l10n.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key, this.isFirstRun});
  final bool? isFirstRun;

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
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.primaryColor,
            selectionColor: AppColors.primaryColor.withOpacity(0.5),
            selectionHandleColor: AppColors.primaryColor,
          ),
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          fontFamily: 'PT Sans',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        initialRoute: isFirstRun! ? Routes.onBoardingScreen : Routes.navBar,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

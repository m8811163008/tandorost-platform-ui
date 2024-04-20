import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tandorost/navigation.dart';

class TandorostApplication extends StatelessWidget {
  const TandorostApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final lightThemeData = AppThemeLightThemeData(locale: const Locale('fa'));
    final darkThemeData = AppThemeDarkThemeData(locale: const Locale('fa'));
    return MaterialApp.router(
      theme: lightThemeData.materialThemeData,
      darkTheme: darkThemeData.materialThemeData,
      themeMode: ThemeMode.light,
      routerConfig: Navigation.goRouter(context),
      title: 'Tandorost',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ComponentLibraryLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa"),
      ],
      locale: const Locale("fa"),
    );
  }
}

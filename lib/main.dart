import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/generated/l10n.dart';

import 'util/routes.dart';
import 'core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'core/cubits/localization_cubit/localization_cubit.dart';
import 'core/cubits/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationCubit()..toggle()),
        BlocProvider(create: (context) => AppThemeCubit()..toggle()),
      ],
      child: Builder(
        builder: (context) {
          var themeState = context.select((AppThemeCubit cubit) => cubit.state);
          var langState =
              context.select((LocalizationCubit cubit) => cubit.state);
          // print("theme = $themeState");

          return MaterialApp(
            theme: themeState is AppLightTheme
                ? ThemeData.light()
                : ThemeData.dark(),
            locale: Locale(langState is LocalizationEn ? "en" : "ar"),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const <LocalizationsDelegate<Object>>[
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: AppRoutes.homePage,
            onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}

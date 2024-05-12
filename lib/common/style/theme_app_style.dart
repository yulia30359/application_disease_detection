import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:flutter/material.dart';

ThemeData get themeApp => ThemeData.light().copyWith(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: kPrimary1,

      appBarTheme: AppBarTheme(
        color: kPrimary1,
        toolbarTextStyle: TextStyleTheme.current.bodyText2Light.copyWith(
          color: kPrimary1,
        ),
        actionsIconTheme: const IconThemeData(color: kPrimary1),
        iconTheme: ThemeData.dark().iconTheme.copyWith(color: kNeutral0),
        titleTextStyle: TextStyleTheme.current.bodyText1Light.copyWith(
          color: kNeutral0,
        ),
      ),
      // colorScheme: ColorScheme(
      //     primary: kLightAccent,
      //     primaryContainer: kLightPrimaryVariant,
      //     secondary: kLightAccent,
      //     secondaryContainer: kLightAccentVariant,
      //     surface: kLightSurface,
      //     background: kLightBackground,
      //     error: kLightError,
      //     onPrimary: kLightOnPrimary,
      //     onSecondary: kLightOnSecondary,
      //     onSurface: kLightOnSurface,
      //     onBackground: kLightOnBackground,
      //     onError: kLightOnError,
      //     brightness: Brightness.dark),
      typography: Typography.material2018(),
    );

import 'dart:async';

import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/router/route_list.dart';
import 'package:disease_detection/common/router/routes.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:disease_detection/common/style/theme_app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await runZonedGuarded(() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimary1,
    ));

    await ScreenUtil.ensureScreenSize();
    runApp(const App());
  }, (error, stack) {
    if (kDebugMode) {
      debugPrint('run zoned guarded : $error');
    }
  });
}

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kPrimary1,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (_, child) {
        TextStyleTheme.init();
        return LayoutBuilder(
          builder: (context, constraints) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Plant Disease Detection',
              theme: themeApp,
              initialRoute: RouteList.main,
              routes: Routes().allRoutes,
              onGenerateRoute: Routes.getRouteGenerate,
              navigatorKey: navigatorKey,
              builder: (context, child) {
                return child ?? const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}

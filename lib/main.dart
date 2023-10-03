import 'dart:io';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hse_app/appTheme/apptheme.dart';
import 'package:hse_app/pages/home_Page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();


  HttpOverrides.global = MyHttpOverrides();
  runApp(
      DevicePreview(enabled: true, builder: (context) => MyApp()));
  // MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PlatformApp(
          title: 'App Title',
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          material: (_, __) => MaterialAppData(
              theme: MyTheme.appThemeData, darkTheme: MyTheme.appThemeData),
          cupertino: (_, __) => CupertinoAppData(
            theme: MyTheme.iosThemeData,
          ),
          home: HomePage(),
          routes: {
            "/splash": (context) => HomePage(),}
    );
  
}
}

// ignore: non_constant_identifier_names
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
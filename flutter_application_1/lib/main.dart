import 'package:flutter/material.dart';
import 'package:flutter_full_learn/navigation/personalweb.dart';
import 'package:flutter_full_learn/pdf.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

import 'package:flutter_full_learn/product/theme/light_theme.dart';
import 'package:flutter_full_learn/views/file_download_view.dart';

import 'navigation/lottiestart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'glyadgzl',
      debugShowCheckedModeBanner: false,
      theme: LighTheme().theme,
      //theme: context.watch<ThemeNotifer>().currentTheme,
      routes: NavigatorRouters().items,

      //home: FileDownload(),
    );
  }
}

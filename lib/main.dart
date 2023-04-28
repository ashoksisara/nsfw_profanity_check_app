import 'package:demo_app/provider/home_provider.dart';
import 'package:demo_app/shared/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.appBlack,
            foregroundColor: AppColor.appWhite,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

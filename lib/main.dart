import './res/colors/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/res/getx_loclization/languages.dart';
import '/res/routes/routes.dart';

void main() {
  runApp(
    const MyApp()
     );
     
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crm Innerx',
      translations: Languages(),
      locale: const Locale('en' ,'US'),
      fallbackLocale: const Locale('en' ,'US'),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        secondaryHeaderColor: Colors.black,
         textTheme: GoogleFonts.urbanistTextTheme(),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        // useMaterial3: false,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}


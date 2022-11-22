import 'dart:io';

import 'package:flutter/material.dart';
import 'ui/people_screen.dart';
import 'common/strings_masseges.dart';
import 'ui/theme.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //if we want relative appBar height wz can use this:
    //WidgetsBinding.instance.window.physicalSize.height *.08;
    double height = 56; 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StrConst.strAppName,
      theme: ThemeData(
        primaryColor: Colors.black ,
        scaffoldBackgroundColor: ThemeConfig.colorBody,
        appBarTheme: AppBarTheme(
          foregroundColor: ThemeConfig.colorTitles,
          shape: const Border( bottom: BorderSide(
                  color: ThemeConfig.colorBorders,
                  width: 1
                )
          ),
          backgroundColor: ThemeConfig.colorItemRectgl, 
          toolbarTextStyle: ThemeConfig.txtStyleAppBTit,
          centerTitle: true,
          elevation: 0,
          toolbarHeight:height),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ThemeConfig.colorIndicator),
        fontFamily: ThemeConfig.fntFamilyApp,
      ),
      initialRoute: PeopleScreen.route,
      routes: {
        PeopleScreen.route : (context)=> const PeopleScreen(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_block/models/mycolors.dart';
import 'package:tech_block/view/home_screen.dart';
import 'package:tech_block/view/main_screen.dart';
import 'package:tech_block/view/mycats.dart';
import 'package:tech_block/view/register_intro.dart';
import 'package:tech_block/view/splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: solidcolors.scaffoldBG,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: solidcolors.systemNavigationBar,
    systemNavigationBarIconBrightness: Brightness.dark,

  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // Farsi
        ],
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Color.fromARGB(121, 103, 104, 102),
              fontSize: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(width: 2),

            ),
            filled: true,
         fillColor: Colors.white
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
           style: ButtonStyle(
                textStyle: WidgetStateProperty.resolveWith((states){
                  if(states.contains(WidgetState.pressed)){
                    return TextStyle(fontSize: 27,fontWeight: FontWeight.bold,fontFamily: "bnazanin");
                  }
                  return TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "bnazanin");
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states){
                  if(states.contains(WidgetState.pressed)){
                    return Color.fromARGB(195, 53, 201, 255);
                  }
                  return solidcolors.primaryColor;
                }),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              )
          )
        ),
        debugShowCheckedModeBanner: false,
        home:mainScreen(),
    );
  }}


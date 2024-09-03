 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_block/view/main_screen.dart';
import 'package:tech_block/models/mycolors.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>mainScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return const SafeArea(
       child: Scaffold(
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Image(image: AssetImage("assets/images/logo640.png"),height: 64,),
               SpinKitThreeBounce(
                 color: solidcolors.primaryColor,
                 size: 20.0,
               )
             ],
           ),
         ),
       ),
     );
  }
}
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/data_models.dart';
import '../models/faka_data.dart';
import '../models/my_strings.dart';
import '../models/mycolors.dart';
import 'myComponents.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen ({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  var size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/profileAvatar.png"),height: 100,),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ImageIcon(AssetImage("assets/icons/blue_pen.png"),color: solidcolors.seeMore,),
            SizedBox(width: 12,),
            Text(mystrings.editProfileImage,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "bnazanin",color: solidcolors.seeMore),),
          ],),
          SizedBox(height: 60,),
          Text("فاطمه امیری",style: TextStyle(color:solidcolors.primaryColor,fontWeight: FontWeight.w700,fontSize: 20,fontFamily: "bnazanin"),),
          SizedBox(height: 12),
          Text("fatemeh@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin"),),
          SizedBox(height: 40,),
          techdivider(size: size),
          InkWell(
            onTap: ((){
              
            }),
            splashColor: solidcolors.primaryColor,
            child: SizedBox(
            height: 45,
              child: Center(child: Text(mystrings.myfavoriteText , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin")))),
          ),
          techdivider(size: size),
          InkWell(
            onTap: ((){

            }),
            splashColor: solidcolors.primaryColor,
            child: SizedBox(
                height: 45,
                child: Center(child: Text(mystrings.myPodcastText , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin")))),
          ),
          techdivider(size: size),
          InkWell(
            onTap: ((){

            }),
            splashColor: solidcolors.primaryColor,
            child: SizedBox(
                height: 45,
                child: Center(child: Text(mystrings.logOutText , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin")))),
          ),
          SizedBox(height: 100,)


        ],
      )
    );
  }
}




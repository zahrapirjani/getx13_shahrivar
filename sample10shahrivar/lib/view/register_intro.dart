import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_block/models/faka_data.dart';
import 'package:tech_block/models/my_strings.dart';
import 'package:tech_block/models/mycolors.dart';
import 'package:validators/validators.dart';

import 'mycats.dart';

class RegisterIntro extends StatefulWidget{
  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: solidcolors.scaffoldBG,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///
                /// //
                SvgPicture.asset("assets/images/tcbot.svg",height: 100 ,),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                    text: mystrings.wellcomeText,
                    style: TextStyle(color: solidcolors.primaryColor,fontWeight: FontWeight.bold,fontSize: 18 ),
                  )),
                ),
                SizedBox(height: 12,),
                ElevatedButton(onPressed: (){
                  _showEmailBottomSheet(context, size);
                }, child: Text("بزن بریم",style: TextStyle(color: Colors.white),),

                )
              ],
            ),
          ),
        ));
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size) {

    return showModalBottomSheet(context: context,backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder:(context){
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      width: double.infinity,
                      height: size.height/2.2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(12)),


                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(mystrings.enterEmail,style: TextStyle(fontSize: 20,fontFamily: "bnazanin",fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(26, 26, 26, 0),
                            child: TextField(
                              onChanged:(value){

                              } ,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                              hintText: "aaa@gmail.com",
                            ),
                            ),
                           ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: ElevatedButton(onPressed:(){
                              Navigator.pop(context);
                              _showActivateCodeBottomSheet(context, size);
                            } , child: const Text("ادامه",style: TextStyle(color: Colors.white),)),
                          ),
                        ],
                      ),
                    ),
                  );
                } );
  }


  Future<dynamic> _showActivateCodeBottomSheet(BuildContext context, Size size) {

    return showModalBottomSheet(context: context,backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder:(context){
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              height: size.height/2.2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(12)),


              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(mystrings.activateCode,style: TextStyle(fontSize: 20,fontFamily: "bnazanin",fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 26, 26, 0),
                    child: TextField(
                      onChanged:(value){

                      } ,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "******",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ElevatedButton(onPressed:(){
Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => MyCategory() ));
                    } , child: const Text("ادامه",style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
            ),
          );
        } );
  }
}
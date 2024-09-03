import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_block/models/my_strings.dart';
import 'package:tech_block/models/mycolors.dart';
import 'package:tech_block/view/myComponents.dart';

import '../models/faka_data.dart';
import 'home_screen.dart';

class MyCategory extends StatefulWidget{
  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     double bodyMargin = size.width/10;
     return SafeArea(child: Scaffold(
       backgroundColor:solidcolors.scaffoldBG ,
       body: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         padding: EdgeInsets.only(right: bodyMargin,left: bodyMargin),
         child: Column(
           children: [
             SizedBox(height: 60,),
             SvgPicture.asset("assets/images/tcbot.svg",height: 100 ,),
             Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Text(mystrings.successfulRegister,style: TextStyle(fontSize: 19,fontWeight:FontWeight.bold,fontFamily: "bnazanin"),textAlign: TextAlign.center ,
               ),
             ),
             SizedBox(height: 25 ,),
             Padding(
               padding: const EdgeInsets.all(.0),
               child: TextField(
               decoration: InputDecoration(
                 hintText: "نام و نام خانوادگی"

               ),
               ),
             ),
             SizedBox(height: 25,),
             Text(mystrings.chooseCats,style: TextStyle(fontSize: 19,fontWeight:FontWeight.bold,fontFamily: "bnazanin"),textAlign: TextAlign.center ,
             ),
             Padding(
               padding: const EdgeInsets.only(top: 32),
               child: SizedBox(
                 width: double.infinity,
                 height: 105 ,
                 child: GridView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: ClampingScrollPhysics(),
                     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                       crossAxisSpacing: 15,
                       mainAxisSpacing: 15,
                       childAspectRatio: 0.3
                     ),
                     itemCount: tagList.length ,
                     shrinkWrap: true,
                     itemBuilder: (context,index){
                   return InkWell(
                       onTap: (){
                         setState(() {
                           if(!myCat.contains(tagList[index])){
                             myCat.add(tagList[index]);
                           }

                         });
                       },
                       child: HashTags(index: index));
                 }),
               ),
             ),
             SizedBox(height: 45,),
             ImageIcon(AssetImage("assets/icons/down_cat_arrow.png",),size: 60,),
             Padding(
               padding: const EdgeInsets.only(top: 32),
               child: SizedBox(
                 width: double.infinity,
                 height: 105 ,
                 child: GridView.builder(
                     scrollDirection: Axis.horizontal,
                     physics: ClampingScrollPhysics(),
                     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                         crossAxisSpacing: 15,
                         mainAxisSpacing: 15,
                         childAspectRatio: 0.3
                     ),
                     itemCount: myCat.length ,
                     shrinkWrap: true,
                     itemBuilder: (context,index){
                       return Container(
                           height: 60,
                           decoration: const BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(15)),
                               color: Color.fromARGB(213, 220, 217, 217)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(myCat[index].title,style: TextStyle(color: Colors.deepPurple,fontFamily: "bnazanin",fontSize: 16,fontWeight: FontWeight.w900),),
                                   SizedBox(width: 10,),
                                 InkWell(
                                   onTap: (){
                                     setState(() {
                                       myCat.remove(myCat[index]);
                                     });
                                   },
                                   child: Icon(CupertinoIcons.delete,color: Color.fromARGB(
                                       121, 74, 72, 72),size: 23,),

                                 ),



                               ],
                             ),
                           )

                       );
                     }),
               ),
             ),
             SizedBox(height: 30,),
             ElevatedButton(onPressed: (){}, child: Text("ادامه",style: TextStyle(color: Colors.white),))
           ]
         ),
       ),
     ));
  }
}
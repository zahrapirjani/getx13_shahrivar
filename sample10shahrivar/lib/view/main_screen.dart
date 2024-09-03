import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_block/models/my_strings.dart';
import 'package:tech_block/models/mycolors.dart';
import 'package:tech_block/view/Profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_block/view/myComponents.dart';
import '../models/data_models.dart';
import '../models/faka_data.dart';
import 'home_screen.dart';

class mainScreen extends StatefulWidget{

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  var selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width/14;
     return SafeArea(
       child: Scaffold(
         key:_key,
         drawer: InkWell(

           onTap: (){
           },
           child: Drawer(
             backgroundColor: solidcolors.scaffoldBG,
             child: Padding(
               padding:  EdgeInsets.only(right: bodyMargin,left: bodyMargin),
               child: ListView(
                 children: [
                   DrawerHeader(child: Image.asset("assets/images/logo-tech.png",scale: 3,)),
                   ListTile(title: Text("پروفایل کاربری",style: TextStyle(fontFamily:"bnazanin",fontSize: 16,fontWeight: FontWeight.bold ),)
                     ,onTap: (){},),
                   Divider(color: solidcolors.dividerColor,thickness: 0.3 ,),
                   ListTile(title: Text("درباره تکبلاگ",style: TextStyle(fontFamily:"bnazanin",fontSize: 16,fontWeight: FontWeight.bold ),)
                     ,onTap: (){},),
                   Divider(color: solidcolors.dividerColor,thickness: 0.4 ,),
                   ListTile(title: Text("اشتراک گذاری تکبلاگ",style: TextStyle(fontFamily:"bnazanin",fontSize: 16,fontWeight: FontWeight.bold ),)
                     ,onTap: (){},),
                   Divider(color: solidcolors.dividerColor,thickness: 0.4 ,),
                   ListTile(title: Text("تکبلاگ در گیتهاب ",style: TextStyle(fontFamily:"bnazanin",fontSize: 16,fontWeight: FontWeight.bold ),)
                     ,onTap: (){},),
                   Divider(color: solidcolors.dividerColor,thickness: 0.4 ,)
                 ],
               ),
             ),
           ),
         ),
         appBar: AppBar(
           automaticallyImplyLeading: false,
           elevation: 0,
           backgroundColor: solidcolors.scaffoldBG,
           title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               InkWell(
                 onTap: (){
                   setState(() {
                     _key.currentState!.openDrawer();
                   });
                 },
                   child: Icon(Icons.menu,color: Colors.black,)),
               Image(image: AssetImage("assets/images/logo640.png"), height:size.height/20),
               Icon(Icons.search,color: Colors.black,),
             ],
           ),
         ),
         backgroundColor: solidcolors.scaffoldBG,
         body: Stack(
           children: [
            Center(child:Positioned.fill(child: IndexedStack(
              index: selectedIndex,
              children: [
                homeScreen(size: size, bodyMargin: bodyMargin),
                ProfileScreen(size: size, bodyMargin: bodyMargin),
              ],
            ))),
             BottonNav(size: size, bodyMargin: bodyMargin, changepage: (int value ) {
               setState(() {
                 selectedIndex=value;
               });
             },),
           ],
         ),

       ),
     );
  }
}

class BottonNav extends StatelessWidget {
   BottonNav({
    super.key,
    required this.size,
    required this.bodyMargin, required this.changepage,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changepage;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0 ,
      child: Container(
        height: size.height/12,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: gradiantcolors.bottmNavBG,
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin,left: bodyMargin),
          child: Container(
            height: size.height/2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30 )),
                gradient: LinearGradient(
                    colors: gradiantcolors.bottmNav,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: ()=>changepage(0), icon: Icon(CupertinoIcons.home,size: 45,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.energy_savings_leaf,size: 45,color: Colors.white,)),
                IconButton(onPressed: ()=>changepage(1), icon: Icon(CupertinoIcons.profile_circled,size: 45,color: Colors.white,)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


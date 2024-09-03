import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/faka_data.dart';
import '../models/mycolors.dart';

class techdivider extends StatelessWidget {
  const techdivider({
    super.key,
    required this.size,
  });

  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return Divider(
        indent: size.width/7,
        endIndent:size.width/7 ,
        color:solidcolors.dividerColor);
  }
}
class HashTags extends StatelessWidget {
  var index;
 HashTags({
    super.key,
   required this.index,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black,
            gradient: LinearGradient(colors: gradiantcolors.tags,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.tag,color: Colors.white,size: 20,),
              SizedBox(width: 10,),
              Text(tagList[index].title,style: TextStyle(color: Colors.white,fontFamily: "bnazanin",fontSize: 16,fontWeight: FontWeight.bold),)

            ],
          ),
        )

    );
  }
}
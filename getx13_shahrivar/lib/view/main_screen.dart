import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx13_shahrivar/model/product.dart';
class MainScreen extends StatelessWidget{
Rx<Product> product = Product(name: "benz", price: "100T", off: "2%").obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Obx(((){
              return Column(
                children: [
                  Text("Counter: ${product.value.name}"),
                  Text("Counter: ${product.value.price}"),
                  Text("Counter: ${product.value.off}"),
                ],
              );
            })),
            ElevatedButton(style:ButtonStyle(backgroundColor:WidgetStatePropertyAll<Color>(Colors.green) ),onPressed: (){
              product.update((value){
                value!.name="pride";
                value.price="2T";
                value.off="3%";
              });
            }, child: Icon(Icons.update,color: Colors.white,),)
          ],
        ),
      ),
   );
  }
  
}
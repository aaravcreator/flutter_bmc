import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InstaHome extends StatelessWidget {
  const InstaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('assets/instagram.png',height: 50,),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.camera_enhance),
        actions: [
          IconButton(onPressed:(){},icon:Icon(Icons.favorite_outline),),
          IconButton(onPressed:(){},icon:Icon(Icons.send),),
        ],
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: CircleAvatar(backgroundColor:Colors.blue,radius: 30,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Username",style:TextStyle(color:Colors.white,fontSize: 18)),
              Text("@username",style:TextStyle(color:Colors.white))
            ],)
              ],
            )
            ,
            IconButton(onPressed: (){}, icon:Icon(Icons.more_vert,color: Colors.white,))
          ],
        ),
        Container(),
        Row(),
      ]),
    );
  }
}
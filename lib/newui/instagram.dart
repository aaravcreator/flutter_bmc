import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mero_futter/newui/postitem.dart';

import '../models/post.dart';

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
      body: 
      // SingleChildScrollView(
      //   child: Column(children: [
      
      //     InstaPost(),
      //      InstaPost(),
      //       InstaPost(),
      //   ]),
      // ),
      // ListView(
      //   children: [
      //         InstaPost(post:getPosts()[0]),
      //     //  InstaPost(),
      //     //   InstaPost(),
      //   ],
      // )
      ListView.builder(
        itemCount: getPosts().length,
        itemBuilder: (context,index)=>InstaPost(post:getPosts()[index]))
    );
  }
}
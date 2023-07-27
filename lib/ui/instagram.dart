import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mero_futter/ui/postitem.dart';

import '../models/post.dart';

class InstagramHomePage extends StatelessWidget {
  const InstagramHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.camera_enhance),
        title: Image.asset('assets/instagram.png',height: 40,),
        actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send)),
         
        ],
        ),

      body:
      // ListView(
      //   children:[PostItem(), PostItem(),PostItem(),PostItem()],
      // ) ,
      ListView.builder(
        itemCount: getPosts().length,
        itemBuilder: (context,index)=> PostItem(post:getPosts()[index])),
    );
  }

}
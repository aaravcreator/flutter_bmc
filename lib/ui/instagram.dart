import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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

      body: Center(child: Column(

        children: [
          _buildTopPart(),
        
          Container(
            margin: EdgeInsets.only(top:8),
            color: Colors.red,
            height: 500,
            width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //             // border: Border.all(width: 5),
    // borderRadius: BorderRadius.circular(5), ),
            child: Image.asset('assets/cat.png',fit: BoxFit.cover,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed:(){},icon:Icon(Icons.favorite_border_outlined,color: Colors.white)),
                  IconButton(onPressed:(){},icon:Icon(Icons.messenger_outline,color: Colors.white)),
                  IconButton(onPressed:(){},icon:Icon(Icons.send,color: Colors.white)),
                  
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border,color: Colors.white))
            ],
          )
        ],
      )),
    );
  }



Widget _buildTopPart(){
  return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              CircleAvatar(backgroundColor: Colors.blue,),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Aarav Poudel',style: TextStyle(fontSize: 18,color: Colors.white)),
                Text("Sponsored",style: TextStyle(color: Colors.white))
              ],),
            )
            ]),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,))
          ],);
}
}
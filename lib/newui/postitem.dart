import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
class InstaPost extends StatelessWidget {
  const InstaPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // _renderContainer(),
        _buildPostTop(),
        Image.asset('assets/cat.png',height: 300,fit:BoxFit.cover),
        // Row(),
        _buildBottomPart(),
      ]);
  }



Widget _renderContainer(){
  return Container(
    height: 100,
    width: double.infinity,
    color:Colors.red,
  );
}

Widget _buildPostTop(){
  return Row(
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
        );
}


Widget _buildBottomPart(){
  return Row(
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
          );
}
}
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class PostItem extends StatelessWidget {
  final Post? post; 
  const PostItem({super.key,this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _buildTopPart(),
          _buildImagePart(),
          _buildBottomPart()
        ],
      );
  }



Widget _buildImagePart(){
  return  Container(
            margin: EdgeInsets.only(top:8),
            color: Colors.red,
            height: 400,
            width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //             // border: Border.all(width: 5),
    // borderRadius: BorderRadius.circular(5), ),
            // child: Image.asset('assets/cat.png',fit: BoxFit.cover,),
            child:Image.network('https://reqres.in/img/faces/2-image.jpg'));
         
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


Widget _buildTopPart(){
  return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              CircleAvatar(backgroundColor: Colors.blue,
              // child: Image.network('https://reqres.in/img/faces/2-image.jpg') ,
              // backgroundImage:),
              
              
              ),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('${post?.name}',style: TextStyle(fontSize: 18,color: Colors.white)),
                Text("${post?.username}",style: TextStyle(color: Colors.white))
              ],),
            )
            ]),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,))
          ],);
}
  
}
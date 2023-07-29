import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
class InstaAddPost extends StatefulWidget {
  const InstaAddPost({super.key});

  @override
  State<InstaAddPost> createState() => _InstaAddPostState();
}

class _InstaAddPostState extends State<InstaAddPost> {

final title = TextEditingController();
bool loading = false;
String? message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    
    
    body: Column(children: [
      TextField(controller:title ,),
    _renderText(),
      ElevatedButton(onPressed: ()async{
        loading = true;
        final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/public');
       final response = await http.get(url);
       if (response.statusCode == 200){
       Map<String,dynamic>  body = jsonDecode(response.body);
      
       setState(() {
          message = body['message'];
          print(message);
          loading = false;
       });
       }
     
        print('Title : ${title.text}');
      }, child:Text("Create Post")),
    ]),);
  }


  Widget _renderText(){
      if (loading){
        return Center(child: CircularProgressIndicator());
      }
     if(message !=null) 
     {return Text("$message  ff${loading} ");}
     else
     { return Text("No message ${loading}");}
  }
}
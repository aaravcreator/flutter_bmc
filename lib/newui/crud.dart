import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mero_futter/models/todo.dart';
class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {

  String? message;
  MyTodo todo = MyTodo(user: 1, title: 'Default', completed: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD DEMO'),),
      body: Center(
        child: Column(children: [
          SizedBox(height: 20,),




        
          Text('$message',style: TextStyle(fontSize: 18),),

          ElevatedButton(onPressed: () async{

            final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/public');
            final response = await http.get(url);
            if (response.statusCode == 200){
              Map<String,dynamic> body = jsonDecode(response.body);

             

              setState(() {
                 message = body['message'];
              print(message);
              });

            }
          }, child: Text("GET random int message")),

          


          ListTile(title:Text("${todo?.title}"),subtitle: Text("${todo?.title}"),),
          ElevatedButton(onPressed: ()async{

            final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/2/');
            final response = await http.get(url);
            if (response.statusCode == 200){
              Map<String,dynamic> body = jsonDecode(response.body);

             

              setState(() {
                // 
                print(body);
                todo.title = body['title'];
                todo.completed = body['completed'];

              // print(message);
              });

            }


          }, child: Text("GET TODO")),

          ElevatedButton(onPressed: ()async{


Random random = Random();
int randomNumber = random.nextInt(1000); 
            final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/2/');
            final response = await http.put(url,headers:{ "Content-Type" : "application/json"},body: jsonEncode({
        "user": 1,
        "id": 1,
        "title":"mero todo $randomNumber",
        "completed": false
    }));
            if (response.statusCode == 200){
              Map<String,dynamic> body = jsonDecode(response.body);

             

              setState(() {
                // 
                print(body);
                print(body);
                todo.title = body['title'];
                todo.completed = body['completed'];

              // print(message);
              });

            }
            else{
              print(response.statusCode);
            }


          }, child: Text("UPDATE TODO"))

          ,
          ElevatedButton(onPressed: ()async{

            final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/1/');
            final response = await http.delete(url,headers:{ "Content-Type" : "application/json"});
            if (response.statusCode == 200){
              Map<String,dynamic> body = jsonDecode(response.body);

             

              setState(() {
                // 
                print(body);
                
              // print(message);
              });

            }
            else{
              print(response.statusCode);
            }


          }, child: Text("Delete TODO"))

          ,
          ElevatedButton(onPressed: ()async{

            final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/');
            final response = await http.post(url,headers:{ "Content-Type" : "application/json"},body: jsonEncode({
        "user": 1,
        "id": 1,
        "title":"new todo created",
        "completed": true
    }));
            if (response.statusCode == 200 || response.statusCode == 201){
              Map<String,dynamic> body = jsonDecode(response.body);

             

              setState(() {
                // 
                print(body);
                
              // print(message);
              });

            }
            else{
              print(response.statusCode);
            }


          }, child: Text("Create TODO"))







        ]),
      )
      ,
    );
  }
}
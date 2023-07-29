import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/new_post.dart';





Future<Todo> fetchTodo() async{
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  final response = await http.get(uri);
  if (response.statusCode == 200){
    print("gott data");

    print(todoFromJson(response.body).title);
      return todoFromJson(response.body);
  }
  else {
    throw Exception("Failed to load Todo");
  }
  
}
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  Future<Todo?>? todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO LIST")),
      body: Column(children: [

        FutureBuilder<Todo?>(future:todo, builder:(context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();

          }
          else if ( snapshot.connectionState == ConnectionState.none){
            return  Container();

          }
          else {

            
            print("got data");
            return _buildTodo(context,snapshot.data);
          }
          
         

        }),
        IconButton(onPressed: (){
          setState(() {
            todo = fetchTodo();
          });

        }, icon: Icon(Icons.get_app))
      ]) ,
    );
  }

Widget _buildTodo(BuildContext context, Todo? todo){
  return ListTile(title: Text("${todo?.title}"),subtitle:Text("${todo?.completed}"),);
}
 
}
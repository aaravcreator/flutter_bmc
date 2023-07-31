import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../models/todo.dart';
import '../services/todo_service.dart';

class MeroTodo extends StatefulWidget {
  const MeroTodo({super.key});

  
  @override
  State<MeroTodo> createState() => _MeroTodoState();
}

class _MeroTodoState extends State<MeroTodo> {
  List<MyTodo>  todos = [] ;
  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async{
     final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/');
  final response = await http.get(url);
  if (response.statusCode == 200){
    print('got');
    print(response.body);
    var list = json.decode(response.body) as List<dynamic>;
    print(list.length);
    setState(() {
      todos =  list.map((item)=>MyTodo.fromJson(item)).toList();
    });
    
  }
  }

  Future<void> _createTodos(Map<String,dynamic> data) async{
    print("post data");
    String jsonData = jsonEncode(data);
     final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/');
  final response = await http.post(url,body: jsonData,headers:{ "Content-Type" : "application/json"});
  if (response.statusCode == 201){
    print(response.body);
    var responseJson = json.decode(response.body);
    setState(() {
      todos.add(MyTodo.fromJson(responseJson));
    });
    
  }
  else{
    throw Exception('Error creating Todo');
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Mero TODO")),body: Container(child: 
      // FutureBuilder(future: fetchTodos(),builder: (context, snapshot){
      //   return ListView.builder(
      //     itemCount: snapshot.data?.length,itemBuilder: (context,index)=> ListTile(
      //       title: Text('${snapshot.data?[index].title}'),
      //       subtitle: Text('${snapshot.data?[index].completed}'),
      //   ));
      // },)
      SingleChildScrollView(
        child: Column(
          children: [

           Row(children: [

             FloatingActionButton(
              tooltip: "Refresh Todos",
              onPressed: (){
              _fetchTodos();
            },child: Icon(Icons.refresh),),
             FloatingActionButton(
              backgroundColor: Colors.green,
              tooltip: "Add Todos",
              onPressed: (){
              // _fetchTodos();
              _addTodo();
            },child: Icon(Icons.add),),
            
           ],),
            ListView.builder(
              shrinkWrap: true,
              itemCount:todos.length,itemBuilder: (context,index){
                  final color = todos[index].completed?Colors.black :Colors.green;
                
                return ListTile(
              
              title: Text('${todos[index].title}', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              color: color,
              decoration: todos[index].completed ? TextDecoration.lineThrough : TextDecoration.none,
            ),),
                  // subtitle: Text('${todos[index].completed}'),
            );}),

          ],
        ),
      )
    ),);
  }



// Inside the _HomePageState class

void _addTodo() {
  bool newCompleted = false;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController titleController = TextEditingController();

      return AlertDialog(
        title: Text('Add Todo'),
        content: Column(
          children: [
            // Checkbox(value: value, onChanged: onChanged),
            CheckboxListTile(
                value: newCompleted,
                onChanged: (value) => setState(() => newCompleted = value!),
                title: Text('Completed'),
              ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
             
               final MyTodo meroTodo =  MyTodo(completed:true,title: titleController.text,user:1);
                // print('todo added ${titleController.text}');
                _createTodos(meroTodo.toJson());
              
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}



}
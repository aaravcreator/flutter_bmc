import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

// import '../models/new_post.dart';




Future<List<MyTodo>> fetchMyTodos()async{
  final url = Uri.parse('https://iotapi.pi-innovations.com.np/api/todo/');
  final response = await http.get(url);
  if (response.statusCode == 200){
    print('got');
    print(response.body);
    var list = json.decode(response.body) as List<dynamic>;
    print(list.length);

    List<MyTodo> todos = list.map((item)=>MyTodo.fromJson(item)).toList();
    print(todos);
    return todos;
  }
  else{
    throw Exception('API Request Error');
  }

}
// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

MyTodo todoFromJson(String str) => MyTodo.fromJson(json.decode(str));

String todoToJson(MyTodo data) => json.encode(data.toJson());

class MyTodo {
    int user;
    int? id;
    String title;
    bool completed;

    MyTodo({
        required this.user,
         this.id,
        required this.title,
        required this.completed,
    });

    factory MyTodo.fromJson(Map<String, dynamic> json) => MyTodo(
        user: json["user"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "id": id,
        "title": title,
        "completed": completed,
    };
}




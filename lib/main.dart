// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo/components/todo_list.dart';
import 'package:flutter_todo/pages/add_page.dart';
import 'package:flutter_todo/pages/edit_page.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:flutter_todo/pages/view_todo.dart';
import 'package:get/get.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final TodoList controller = Get.put(TodoList());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(name: '/view_all_todos', page: () => AddPage()),
        GetPage(name: '/add_todo', page: () => AllTodo()),
        GetPage(name: "/edit_todo", page: () => EditTodo())
      ],
    );
  }
}
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_todo/components/todo_list.dart';
import 'package:flutter_todo/pages/edit_page.dart';

import 'package:get/get.dart';

class AllTodo extends StatelessWidget {
  AllTodo({super.key});

  final TodoList controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("All tasks"),
          backgroundColor: Colors.green,
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0), 
                    color: Colors.greenAccent
                  ),
                  child: ListTile(
                    title: Obx(() => Text(controller.todos[index].title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(decoration: controller.todos[index].completed.value ? TextDecoration.lineThrough : null),)),
                    leading: Obx(() => Checkbox(
                            value: controller.todos[index].completed.value,
                            onChanged: (value) => controller.toggleTodo(index), 
                    )),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteTodo(index);
                            },
                        ),
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() => EditTodo(index: index,));
                            },
                          ),
                      ],
                    )
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


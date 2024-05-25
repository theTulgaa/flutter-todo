// ignore_for_file: prefer_const_constructors, unused_field, invalid_use_of_protected_member



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_todo/components/todo_list.dart';
//import 'package:flutter/widgets.dart';

class EditTodo extends StatelessWidget {
  final int? index;
  
  EditTodo({super.key, this.index});

  final TodoList controller = Get.find();
  final TextEditingController _controller = TextEditingController();

  void updateTodo() {

    controller.editTodo(index!, _controller.text);
    _controller.clear();
     Get.back();
     // i am gonna ask this code by Tulgaa brother
     controller.todos.refresh();
  }

  void showEditDialog(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Text("Are you sure to update this task?"),
            content: Text(
              _controller.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            updateTodo();
                          },
                          child: Text("Yes"))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            _controller.clear();
                            Get.back();
                          },
                          child: Text("Cancel"))),
                ],
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Edit tasks"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("EDITING TODO"),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: index != null ? controller.todos[index!].title :null,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        showEditDialog(context);
                      }, 
                      child: Text("Update")
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
//
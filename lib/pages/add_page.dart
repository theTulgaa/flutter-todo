// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, avoid_print

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/components/todo_list.dart';
import 'package:get/get.dart';
//import 'package:flutter/widgets.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
 final TextEditingController _controller = TextEditingController();
 final TodoList controller = Get.find();

  void addTodo() {
     Get.back();
    if(!controller.checkTodoExist(_controller.text)) {
      controller.addTodo(_controller.text);
      Get.snackbar("Success", "This task is added.", backgroundColor: Colors.green);
    }
    else {
      Get.snackbar("Error", "This task is already exist!", backgroundColor: Colors.red);
    }
    _controller.clear();
  }
  void showAddDialog() {
    if(_controller.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Text("Are you sure to add this task?"),
            content: Text(
              _controller.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                      child:
                          ElevatedButton(
                            onPressed: () {
                              addTodo();
                            }, 
                            child: Text("Yes")
                          )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child:
                          ElevatedButton(onPressed: (){
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Add todo"),
          elevation: 20,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("What is your task?"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: TextField(
                        controller: _controller,
                              decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Add todo here",
                            ),
                        ),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SizedBox(
                        height: 63,
                        child: ElevatedButton(
                          onPressed: (){
                            showAddDialog();
                          }, 
                          child: Text("Add todo"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero, // Set all radii to zero
                          ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/add_page.dart';
import 'package:flutter_todo/pages/view_todo.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 70),
                  ),
                  Text(
                    "One day or day one.",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: (){
                            Get.to(() => AddPage());
                          }, 
                          child: Text("Add task", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                        ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => AllTodo());
                        },
                        child: Text("View all tasks", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                      ),
                    ),
                    
                  ],
                ),
            )
          ],
        )
      ),
    );
  }
}
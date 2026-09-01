import 'package:flutter/material.dart';

import 'dart:developer' as logger;

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

TextEditingController todoController = TextEditingController();
List todoList = ["Assignment", "Reading", "cooking"];

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Todo List"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAboutDialog(
            context: context,
            children: [
              Text("Add Todo list"),
              TextField(controller: todoController),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    todoList.add(todoController.text);
                    todoController.clear();
                    Navigator.pop(context);
                  });

                  logger.log(todoList.toString());
                },
                child: Text("Add"),
              ),
            ],
          );
        },
        child: Icon(Icons.add),
      ),
      body: todoList.isEmpty
          ? Center(child: Text("NO TODO LIST"))
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoList[index]),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                    child: const Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}

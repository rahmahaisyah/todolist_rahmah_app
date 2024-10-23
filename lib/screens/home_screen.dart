import 'package:flutter_todolist_rahmah_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist_rahmah_app/utils/todo_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = TextEditingController();
  List<Map<String, dynamic>> toDoList = [
    {'task': 'Bikin portofolio untuk daftar lab', 'completed': false},
    {'task': 'Belajar OOP untuk praktikum DPBO', 'completed': false},
    {'task': 'Belajar praktikum STD', 'completed': false}
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index]['completed'] = !toDoList[index]['completed'];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add({'task': _controller.text, 'completed': false});
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'Rahmah Todolist',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index]['task'],
            taskCompleted: toDoList[index]['completed'],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (value) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add new todo items',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            ),
            FloatingActionButton(
                onPressed: saveNewTask,
                child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

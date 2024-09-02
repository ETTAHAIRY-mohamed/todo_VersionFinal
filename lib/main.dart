import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/pages/count.dart';
import 'package:todo/pages/demo_todo.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  final String task;
  bool stat;
  Task({required this.task, required this.stat});
}

int i = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tasks = [
    Task(task: "gem", stat: true),
    Task(task: "work", stat: false),
    Task(task: "study", stat: false),
    Task(task: "shower", stat: true),
  ];

  final myController = TextEditingController();

  void addtask(String title) {
    setState(() {
      tasks.add(Task(task: title, stat: false));
    });
    myController.clear();
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index].stat = !tasks[index].stat;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myController.dispose();
  }

  void delete(int j){
   setState(() {
      tasks.remove(tasks[j]);
   });
  }
  void deleteAll(){
    setState(() {
      tasks.clear();
    });
  }
 
 
  @override
  Widget build(BuildContext context) {
    int completedTasks = tasks.where((Task) => Task.stat).length;
    int a = tasks.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 41, 107),
        title: Text(
          "TODO",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
              actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: const Icon(Icons.delete,color: Colors.red,size: 32,),
          ),
        ],

      ),
      body: Column(
        children: [
          Count(completedTask: completedTasks, ab: a),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < tasks.length; i++)
                  Todo(
                    data: tasks[i].task,
                    etat: tasks[i].stat,
                    j: i,
                    Changestat: toggleTaskStatus,
                    delite: delete,
                  ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    height: 220,
                    padding: EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          decoration: InputDecoration(hintText: "Add task"),
                          maxLength: 20,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              if (myController.text.isNotEmpty)
                                addtask(myController.text);
                              Navigator.pop(context);
                            },
                            child: Text("ADD"))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

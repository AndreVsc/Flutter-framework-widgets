import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // Lista de tarefas incompletas
  final List<Task> _incompleteTasks = [
    Task(id: '755244', date: '2022-07-09', time: '16:08:31'),
    Task(id: '729000', date: '2022-07-09', time: '16:08:32'),
    Task(id: '626920', date: '2022-07-09', time: '16:08:32'),
    Task(id: '672472', date: '2022-07-09', time: '16:08:33'),
    Task(id: '534172', date: '2022-07-09', time: '16:08:33'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Ação para ver tarefas completas
              },
              child: Text('View Completed Tasks'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You have ${_incompleteTasks.length} uncompleted tasks',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _incompleteTasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Card(
                    color: Colors.amber,
                    elevation: 2,
                    child: CheckboxListTile(
                      title: Text(
                        'Task ${_incompleteTasks[index].date}\n${_incompleteTasks[index].time}:${_incompleteTasks[index].id}',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: _incompleteTasks[index].isCompleted,
                      onChanged: (bool? value) {
                        setState(() {
                          _incompleteTasks[index].isCompleted = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Aviso'),
          content: Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// Modelo para as tarefas
class Task {
  final String id;
  final String date;
  final String time;
  bool isCompleted;

  Task({
    required this.id,
    required this.date,
    required this.time,
    this.isCompleted = false,
  });
}

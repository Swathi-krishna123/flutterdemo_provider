import 'package:flutter/material.dart';
import 'package:flutter_demo_project/add_Student.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'View Students',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddStudents(id:"",)));
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: Column(children: [],),),
    );
  }
}

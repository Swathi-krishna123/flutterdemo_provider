import 'package:flutter/material.dart';
import 'package:flutter_demo_project/Teacher/teachers_view.dart';
import 'package:flutter_demo_project/student/provider.dart';
import 'package:flutter_demo_project/student/students_view.dart';
import 'package:provider/provider.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return ElevatedButton(
                    onPressed: () {
                      value.getStudents();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const StudentsView(),));},
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 32, 73, 34))),
                    child: const Text('STUDENTS',style: TextStyle(fontSize: 30,color: Colors.white),));
              }
            ),
                        const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const TeachersView(),));},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 32, 73, 34))),
                child: const Text('TEACHERS',style: TextStyle(fontSize: 30,color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}

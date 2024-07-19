import 'package:flutter/material.dart';
import 'package:flutter_demo_project/student/add_student.dart';
import 'package:flutter_demo_project/student/provider.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'View Students',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton:
          Consumer<MainProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          onPressed: () {
            value.clearText();

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddStudents(
                      id: "",
                    )));
          },
          child: const Icon(Icons.add),
        );
      }),
      body: Center(
        child: Consumer<MainProvider>(builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: const Color.fromARGB(255, 166, 206, 167),
                // width: MediaQuery.of(context).size.width * 0.1,
                // height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(value.studentList[index].name)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Ph no:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(value.studentList[index].phone)
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: value.studentList.length,
          );
        }),
      ),
    );
  }
}

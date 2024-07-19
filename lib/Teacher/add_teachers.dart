import 'package:flutter/material.dart';
import 'package:flutter_demo_project/student/provider.dart';
import 'package:provider/provider.dart';

class AddTeachers extends StatelessWidget {
  String id;
   AddTeachers({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Add Teachers',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return TextFormField(
                    controller: value.teachernamecontroller,
                    decoration: InputDecoration(
                        hintText: 'Name of the Teacher',
                        border: OutlineInputBorder()),
                  );
                }
              ),
              SizedBox(
                height: 30,
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return TextFormField(
                    controller: value.teacherphonecontroller,
                    decoration: InputDecoration(
                        hintText: 'Phone Number', border: OutlineInputBorder()),
                  );
                }
              ),
              SizedBox(
                height: 30,
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          value.getTeachers();
                          value.addTeachers(context, id);
                        
                          if (value != null) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Task created")));
                        }
                          },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.green)),
                      ));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

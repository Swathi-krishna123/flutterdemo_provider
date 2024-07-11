import 'package:flutter/material.dart';
import 'package:flutter_demo_project/provider.dart';
import 'package:provider/provider.dart';

class AddStudents extends StatelessWidget {
  String id;
  AddStudents({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Add Students',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Consumer<MainProvider>(builder: (context, value, child) {
                return TextFormField(
                  controller: value.namecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Student name"),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return TextFormField(
                    controller: value.phonecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Student phone number'),
                  );
                }
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          value.addStudents(context, id);
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

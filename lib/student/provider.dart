import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/model_class.dart';
import 'package:flutter_demo_project/teachermodel.dart';

class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController teachernamecontroller = TextEditingController();
  TextEditingController teacherphonecontroller = TextEditingController();
  // int counter = 0;

  void addTeachers(BuildContext context, String thr) {
    thr = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["Name"] = teachernamecontroller.text;
    map["Phone"] = teacherphonecontroller.text;
    db.collection("TEACHERS").doc(thr).set(map);
  }

  List<Teachermodel> teacherList = [];
  void getTeachers() {
    db.collection('TEACHERS').get().then((value) {
      if (value.docs.isNotEmpty) {

        for (var element in value.docs) {
          teacherList.add(Teachermodel(
              element.id, element.get("Name"), element.get("Phone")));
          notifyListeners();
          print('=============');
        }
      }
    });
  }

/////////////////////////////////////////////////////////
  void addStudents(
    BuildContext context,
    String Std,
  ) {
    Std = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["Name"] = namecontroller.text;
    map["Phone"] = phonecontroller.text;
    db.collection("STUDENTS").doc(Std).set(map);
  }

  List<StudentModel> studentList = [];
  void getStudents() {
    db.collection('STUDENTS').get().then((value) {
      if (value.docs.isNotEmpty) {
        studentList.clear();
        for (var element in value.docs) {
          studentList.add(StudentModel(
              element.id, element.get("Name"), element.get("Phone")));
          notifyListeners();
          print("here");
        }
      }
    });
  }

  void clearText() {
    namecontroller.clear();
    phonecontroller.clear();
  }
}

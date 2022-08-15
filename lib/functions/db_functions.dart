import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:managment/functions/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addstudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);
  value.id = id;
  await studentDB.put(id, value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  getallStudents();
}

Future<void> getallStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> clearStudent() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentDB.clear();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  getallStudents();
}

Future<void> updateStudent(StudentModel value, int id ) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.put(id, value);
  getallStudents();
}

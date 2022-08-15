import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:managment/add_student.dart';

import 'package:managment/update.dart';

import 'SearchBarFunction.dart';
import 'functions/db_functions.dart';
import 'functions/model/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<StudentModel> studentList;
 
  String query = '';
 
  @override
  void initState() {
    getallStudents();
// clearStudent();
    super.initState();
    final _formkey = GlobalKey<FormState>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Managment '),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: StudentSearch());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: ValueListenableBuilder(
                valueListenable: studentListNotifier,
                builder: (BuildContext ctx, List<StudentModel> studentList,
                    Widget? child) {
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = studentList[index];
                      //************************************ */

                      //******************************* */

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => update(
                                name: data.name,
                                number: data.phonenumber,
                                age: data.age,
                                guardian: data.guardian,
                                id: data.id!,
                                image: data.image,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(data.name),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: FileImage(File(data.image)),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              _showDialog(context, data.id!);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: studentList.length,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: FloatingActionButton(
                elevation: 50,
                hoverColor: Colors.red,
                backgroundColor: Colors.blue,
                autofocus: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStudent()),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  //************************************************************DeleteFunctionAlert************************************************************************ */

  _showDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Are you sure you want to delete?'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteStudent(id);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'YES',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'NO',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:managment/update.dart';

import 'functions/db_functions.dart';
import 'functions/model/data_model.dart';

class StudentSearch extends SearchDelegate<StudentModel> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.navigate_before));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
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
            } else {
              return  Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
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
            } else {
              return Container();
              
            }
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }

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

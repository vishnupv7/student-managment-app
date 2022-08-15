// ignore_for_file: unnecessary_const

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managment/Screen_Home.dart';
import 'package:managment/functions/model/data_model.dart';

import 'functions/db_functions.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _guardiancontroller = TextEditingController();
  final _phonenumberController = TextEditingController();
  File _image = File('file.txt');
  String imagePath = 'jgjhg';
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        title: const Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              'Student Details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: const Color.fromARGB(255, 199, 197, 197),
                      backgroundImage: FileImage(_image),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        imagePick();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 100, left: 70),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.teal,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Center(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 200,
                            ),
                            child: Text(
                              'Full Name',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            //------------------- TEXT FIELD FULL NAME-------------------------
                            child: TextFormField(
                              controller: _namecontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 204, 42, 9),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 180, 179, 179),
                                      width: 2.0),
                                ),
                                hintText: 'Full Name',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid input';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 300,
                            // -------------------TEXT FIELD age----------------------
                            child: TextFormField(
                              controller: _agecontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 225, 14, 14),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 180, 179, 179),
                                      width: 2.0),
                                ),
                                hintText: 'Age',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid input';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Phone Number',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //---------------- TEXT FIELD phone number-------------------
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: _phonenumberController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 226, 7, 7),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 180, 179, 179),
                                      width: 2.0),
                                ),
                                hintText: 'Phone Number',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid input';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Guardian',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ----------------TEXT FIELD guardian----------
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: _guardiancontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 215, 22, 8),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 180, 179, 179),
                                      width: 2.0),
                                ),
                                hintText: 'Guardian',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter valid input';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // -------------------button-----------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // checkLogin(context);
                                  _formkey.currentState!.validate();
                                  onAddStudentButtonClicked();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 20.0),
                                  primary:
                                      const Color.fromARGB(255, 48, 146, 251),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //-----------------button functiom-----------------
  Future<void> onAddStudentButtonClicked() async {
    final name = _namecontroller.text.trim();
    final age = _agecontroller.text.trim();
    final number = _phonenumberController.text.trim();
    final guardian = _guardiancontroller.text.trim();

    if (name.isEmpty || age.isEmpty || number.isEmpty || guardian.isEmpty) {
      return;
    }

    final student = StudentModel(
      name: name,
      image: imagePath,
      age: age,
      phonenumber: number,
      guardian: guardian,
    );

    addstudent(student);
    snackbar(context);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen(), ), (route) => false);
  }

  Future<void> imagePick() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
     return snackbarforimage(context);
     
      
    }
    imagePath = image.path;
    final imageTemp = File(imagePath);
    setState(() {
      _image = imageTemp;
     
    });
  }
  Future <void> snackbar(BuildContext ctx) async {
   
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      content: Text(' new student added'),
      backgroundColor: Color.fromARGB(255, 13, 180, 75),
    ));
    }
     Future <void> snackbarforimage(BuildContext ctx) async {
   
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      content: Text(' no image uploaded'),
      backgroundColor: Color.fromARGB(255, 180, 13, 13),
    ));
    }

   

    

  }



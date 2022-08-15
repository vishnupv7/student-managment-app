// ignore_for_file: unnecessary_const
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Screen_Home.dart';
import 'functions/db_functions.dart';
import 'functions/model/data_model.dart';

class update extends StatefulWidget {
  final String name;
  final int id;
  final String number;
  final String guardian;
  final String age;
  final String image ;


  update({
    Key? key,
    required this.name,
    required this.number,
    required this.age,
    required this.guardian,
    required this.id, required this.image,
     
  }) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {

  File? _image;
 late String imagePath ;
  final _formkey = GlobalKey<FormState>();
  bool _isShown = true;
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController(text: widget.name);
    final agecontroller = TextEditingController(text: widget.age);
    final guardiancontroller = TextEditingController(text: widget.guardian);
    final phonenumberController = TextEditingController(text: widget.number);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        title: const Padding(
            padding: EdgeInsets.only(left: 30),
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
                    padding: EdgeInsets.only(top: 30),
                    
                    child: CircleAvatar(
                      radius: 70,
                      // backgroundColor: Colors.yellow,
                      backgroundImage: (_image == null)?FileImage( File(widget.image)):
                      FileImage( _image!),
                      
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
                        print(widget.image);
                      }
                      ,
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
                            // TEXT FIELD FULL NAME
                            child: TextFormField(
                              controller: namecontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 242, 7, 7),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 219, 217, 217),
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
                                }
                              
                              
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
                            child: TextFormField(
                              controller: agecontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 237, 2, 2),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 219, 217, 217),
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
                                }
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
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: phonenumberController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 239, 17, 5),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 219, 217, 217),
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
                                }
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
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: guardiancontroller,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 223, 26, 4),
                                      width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 219, 217, 217),
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
                                }
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                     _formkey.currentState!.validate();
                                  // namecontroller.text.trim();
                    
                                  updateAddStudentButtonClicked(
                                    
                                    widget.id,
                                    namecontroller.text.trim(),
                                    agecontroller.text.trim(),
                                    phonenumberController.text.trim(),
                                    guardiancontroller.text.trim(),
                                     
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 20.0),
                                  primary:
                                      const Color.fromARGB(255, 48, 146, 251),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "update",
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

  Future<void> updateAddStudentButtonClicked(
      int id, String name, String age, String number, String guardian) async {

    if (name.isEmpty || age.isEmpty || number.isEmpty || guardian.isEmpty) {
      return;
    }

    final student = StudentModel(
      name: name,
      image: (_image == null)?widget.image:imagePath,
      age: age,
      phonenumber: number,
      guardian: guardian,
      id: id,
    );
    

    updateStudent(student, id);
    
    snackbar(context);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen(), ), (route) => false);
  }

  Future<void> snackbar(BuildContext ctx) async {
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      content: Text(' student list updated'),
      backgroundColor: Color.fromARGB(255, 13, 180, 75),
    ));
  }

  Future<void> imagePick() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return ;
      
    }
    imagePath = image.path;
    final imageTemp = File(imagePath);
    setState(() {
      _image = imageTemp;
    });
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:camp_advisor/screens/main_navigation_screen.dart';
import 'package:camp_advisor/services/database_service.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    Key? key,
    required this.lat,
    required this.lon,
    required this.address,
  }) : super(key: key);
  final String lat;
  final String lon;
  final String address;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DatabaseServices databaseServices = DatabaseServices();
  File? imgFile;
  String imgPath = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    placeController.dispose();
    latController.dispose();
    longController.dispose();
    ratingController.dispose();
    descController.dispose();
    costController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    placeController.text = widget.address;
    latController.text = widget.lat;
    longController.text = widget.lon;
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              "New Campsite details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            height: h * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/gmap.jpeg"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Name",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: placeController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Place",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Place",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: ratingController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ratings (out of 5)",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Ratings (out of 5)",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: descController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Description",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: costController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cost",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Cost",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: latController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Latitude",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Latitude",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    width: w * 0.7,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.teal.shade900,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: longController,
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      cursorColor: Colors.teal.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Longitude",
                        hintStyle: TextStyle(
                          color: Colors.teal.shade900.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        labelText: "Longitude",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 5,
                    ),
                    width: w * 0.7,
                    child: GestureDetector(
                      onTap: () {
                        pickImageGal();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              8,
                            ),
                            color: Colors.teal,
                            child: Text(
                              imgFile == null ? "Choose image" : "Change image",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: w * 0.4,
                            padding: EdgeInsets.all(
                              8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(
                                color: Colors.teal.shade800,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              imgFile == null || imgFile == ""
                                  ? "No file chosen"
                                  : imgFile!.path,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.4,
                    margin: EdgeInsets.only(
                      top: h * 0.01,
                      bottom: h * 0.01,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () async {
                        uploadImageToFirebase(context);
                      },
                      child: Center(
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  uploadImageToFirebase(BuildContext context) async {
    String filename = basename(imgFile!.path);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('${nameController.text}/${placeController.text}/$filename');
    UploadTask uploadTask = reference.putFile(imgFile!);
    uploadTask.snapshotEvents.listen((event) async {
      print(event.state);
      if (event.state == TaskState.success) {
        final String downloadURL = await event.ref.getDownloadURL();
        print(downloadURL);

        await event.ref
            .getDownloadURL()
            .then((value) => showUploadStatusAlert(context, downloadURL));
      }
    });
  }

  showUploadStatusAlert(BuildContext context, String url) {
    Widget okButton = TextButton(
      onPressed: () {
        setState(() {
          imgPath = url;
        });
        print("imagePath:${imgPath}");
        databaseServices.addCampSite(
          context,
          nameController.text,
          placeController.text,
          latController.text,
          longController.text,
          ratingController.text,
          imgPath == null || imgPath == "" ? "" : imgPath,
          descController.text,
          costController.text,
        );
        nameController.clear();
        placeController.clear();
        latController.clear();
        longController.clear();
        ratingController.clear();
        imgFile = null;
        descController.clear();
        costController.clear();
        Navigator.pop(context);
      },
      child: Text(
        'OK',
        style: TextStyle(
          color: Colors.teal.shade900,
        ),
      ),
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        'Image upload status',
        style: TextStyle(color: Colors.teal.shade900),
      ),
      content: Text(
        'Image uploaded successfully',
        style: TextStyle(color: Colors.teal.shade900),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  pickImageGal() async {
    var pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imgFile = File(pickedImage!.path);
    });
  }
}

final successImageUpload = SnackBar(
  content: Text(
    'Image upload successful',
    style: TextStyle(
      color: Colors.white,
      backgroundColor: Colors.teal.shade700,
    ),
  ),
);

//ScaffoldMessenger.of(context).showSnackBar(snackBar);

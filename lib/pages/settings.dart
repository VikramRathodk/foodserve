// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/models/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _pNameController = TextEditingController();
  TextEditingController _pSubNameController = TextEditingController();
  TextEditingController _pPriceController = TextEditingController();
  TextEditingController _pCaloriesController = TextEditingController();
  TextEditingController _pRatingController = TextEditingController();
  TextEditingController _pProductInfoController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  String imageUrl = "";

  @override
  void dispose() {
    super.dispose();
    _pCaloriesController.dispose();
    _pNameController.dispose();
    _pPriceController.dispose();
    _pProductInfoController.dispose();
    _pRatingController.dispose();
    _pSubNameController.dispose();
    _categoryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image(fit: BoxFit.contain, image: NetworkImage(imageUrl)),
            ),

            //name
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pNameController,
                decoration: InputDecoration(
                  label: Text(" Name"),
                  hintText: "Product Name",
                ),
              ),
            ),
            //category
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  label: Text(" Caterory"),
                  hintText: "Category  Name",
                ),
              ),
            ),

            //

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pSubNameController,
                decoration: InputDecoration(
                  label: Text(" SubName"),
                  hintText: "Sub Name",
                ),
              ),
            ),
            //

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pPriceController,
                decoration: InputDecoration(
                  label: Text(" Price"),
                  hintText: "Price rate",
                ),
              ),
            ),
            //

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pRatingController,
                decoration: InputDecoration(
                  label: Text(" Rating"),
                  hintText: "Rating ",
                ),
              ),
            ),
            //

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pCaloriesController,
                decoration: InputDecoration(
                  label: Text(" Calories"),
                  hintText: "Calories here...",
                ),
              ),
            ),
            //

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                controller: _pProductInfoController,
                decoration: InputDecoration(
                  label: Text(" Description"),
                  hintText: "write short Description here...",
                ),
              ),
            ),
            //
            MaterialButton(
              onPressed: () {
                addImage();
              },
              child: Text("Add to Image"),
            ),
            MaterialButton(
              onPressed: () {
                addToDatabase();
              },
              child: Text("Add to Database"),
            ),
          ],
        ),
      ),
    );
  }

  Future addImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile? image;

    //permission handling here
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isDenied) {
      //select image form gallery
      image = (await _imagePicker.pickImage(source: ImageSource.gallery));

      var file = File(image!.path);

      int random = Random().nextInt(100);

      if (image != null) {
        var snapshot = await _firebaseStorage
            .ref()
            .child("ImageFolder/${random}")
            .putFile(file)
            .whenComplete(() => print("Successfully addd"));

        var downloadUrl = await snapshot.ref.getDownloadURL();
        print(downloadUrl);
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print("No image received");
      }
    } else {
      print("Permission not Granted...,Try again with permission access");
    }
  }

  addToDatabase() {
    CollectionReference foodInfo =
        FirebaseFirestore.instance.collection("products");
    foodInfo
        .add(
          Products(
            id: foodInfo.doc().id,
            category: _categoryController.text,
            name: _pNameController.text,
            subName: _pSubNameController.text,
            price: _pPriceController.text,
            imageUrl: '',
            calories: _pCaloriesController.text,
            rating: _pRatingController.text,
            productInfo: _pProductInfoController.text,
            noOfProduct: '',
          ).toMap(),
        )
        .whenComplete(() => print("successfully added data into"));
  }
}

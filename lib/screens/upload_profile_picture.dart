import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:praktyki_projekt/screens/chat.dart';

import '../model/utils.dart';
import '../resources/add_data.dart';

class uploadPictureScreen extends StatefulWidget {
  const uploadPictureScreen({super.key});

  @override
  State<uploadPictureScreen> createState() => _uploadPictureScreenState();

}

class _uploadPictureScreenState extends State<uploadPictureScreen> {

  Uint8List? _image;

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String resp = await StorageData().saveData(file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text('select your profile photo by clicking on "add photo" and then press "save photo"',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
              ),
            ),
            GestureDetector(
              onTap: selectImage,
              child: Container(
                height: 50,
                child: Text('Add photo',
                style: TextStyle(
                  fontSize: 30,
                 ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
               saveProfile();
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => chat()));
              },
              child: Container(
                height: 50,
                child: Text('Save photo',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

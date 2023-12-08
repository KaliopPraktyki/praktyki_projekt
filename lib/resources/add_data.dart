
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class StorageData{

  Future<String> uploadImageToStorage(String childName, Uint8List file) async{

    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file
  }) async{
    String resp = "Some error occurred";
    try{
     String imageUrl = await uploadImageToStorage(_auth.currentUser!.uid, file);
     await _firestore.collection("users").doc(_auth.currentUser?.uid).update({
       "profilePicture": imageUrl,
      });
     resp = "success";
    }
        catch(err){
          resp = err.toString();
        }
        return resp;
  }
}
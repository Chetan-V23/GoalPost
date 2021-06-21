import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//Authentication:

class Authentication {
  static Future<bool?> createUserWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    //User? user;

    try {
      print('TRYNG TO CREATE');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('CREATED USER');
      Navigator.of(context).pushNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showError('The password provided is too weak.');
        print('The password provided is too weak');
        return false;
      } else if (e.code == 'email-already-in-use') {
        showError('The account already exists for that email.');
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    //signInWithEmail()
  }

  static Future<bool?> signInWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=auth.currentUser;
      print(user?.uid);
      Navigator.of(context).popAndPushNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        showError('Incorrect Password');
        return false;
      } else if (e.code == 'user-not-found') {
        showError('User not found');
        return false;
      }
    } catch (e) {
      showError('Unknown Error');
      return false;
    }
  }
}

//UserDataBase:

class Userdata {

  //Collection reference:
  FirebaseAuth auth=FirebaseAuth.instance;
  final CollectionReference userCollection= FirebaseFirestore.instance.collection('users');
  
}
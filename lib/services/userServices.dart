import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


//Authentication:

abstract class Authentication {

  static Future<bool?> createUserWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference userCollection= FirebaseFirestore.instance.collection('users');

    try {
      print('TRYNG TO CREATE');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('CREATED USER');
      userCollection.doc(auth.currentUser!.uid).set({
            'email': auth.currentUser!.email, 
            'id':auth.currentUser!.uid,
      }).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
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

abstract class UserdataService {

  //Collection reference:
  static FirebaseAuth auth=FirebaseAuth.instance;
  static final DocumentReference userDocument= FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid);

  static Future updateUserLeagues(List<int> listOfLeagues) async {
    userDocument.set({
      'leagues':listOfLeagues,
    }, SetOptions(merge:true));
  }
}
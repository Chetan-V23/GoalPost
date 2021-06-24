import 'package:flutter/material.dart';
import 'package:goalpost/modals/buttons.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:goalpost/services/userServices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Username: ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hoverColor: Color(0xFF404040),
                        fillColor: Color(0xFF404040),
                        filled: true,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        hintText: 'Enter valid mail id as abc@gmail.com',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This cannot be empty';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please Enter Valid Email';
                      } else
                        return null;
                    },
                    onChanged: (value) {
                      this.email = value;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Password: ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                        hoverColor: Color(0xFF404040),
                        fillColor: Color(0xFF404040),
                        filled: true,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        hintText: 'Enter a password',
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This cannot be empty';
                      } else if (!RegExp(
                              r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                          .hasMatch(value)) {
                        return 'Please Enter Valid Password [atleast 8 characters and one number]';
                      } else
                        return null;
                    },
                    onChanged: (value) {
                      this.password = value;
                    },
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 1,
                    child: MenuButtons(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print('it works');
                          await Authentication.signInWithEmail(
                              context: context,
                              email: this.email!,
                              password: this.password!);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

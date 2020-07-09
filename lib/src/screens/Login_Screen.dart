import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  // ignore: missing_return
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>  with validationMixins{
  final formKey = GlobalKey<FormState>();
  String email=' ';
  String password=' ';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(bottom: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "you@example.com",
         ),
      // ignore: missing_return
      validator: validateEmail,
      onSaved:(value){
        email=value;

      } ,
    );
  }

  passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Password", hintText: "password"),
      // ignore: missing_return
      validator: validatePassword,
      onSaved: (value){
        password=value;
      },
    );
  }

  submitButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
      if( formKey.currentState.validate()) {
        formKey.currentState.save();
        print("post email = $email and password=$password");
      }
      },
      child: Text("submit"),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_using_bloc/sign_up_page.dart';
import 'package:rxdart/rxdart.dart';

import 'api_provider.dart';
import 'bloc.dart';
import 'loader.dart';
import 'main.dart';

class FirebaseLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirebaseLoginPage();
}

class _FirebaseLoginPage extends State<FirebaseLoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final userName = TextEditingController();
  final password = TextEditingController();

  String firebaseId;

  callApi() async {
    Loader().showLoader(context);
    firebaseLoginBloc.signIn = BehaviorSubject<ApiResponseModel>();
    firebaseLoginBloc.signInProcess(userName.text, password.text);
    firebaseLoginBloc.signIn.listen((data) {
      if (data.statusCode == 200) {
        Loader().hideLoader(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        //Background Image
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/regiloginbackground.png"),
            //   fit: BoxFit.fill,
            // ),
            ),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Login Form
            TextField(
              controller: userName,
              decoration: InputDecoration(
                hintText: "Username",
                labelText: "Username",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            // Submit Button
            ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minWidth: 300.0,
              height: 50.0,
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  callApi();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              minWidth: 300.0,
              height: 50.0,
              child: RaisedButton(
                child: Text('Sign up'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}

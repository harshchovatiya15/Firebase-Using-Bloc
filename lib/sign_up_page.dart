import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'api_provider.dart';
import 'bloc.dart';
import 'firebaselogin_page.dart';
import 'loader.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  final userName = TextEditingController();
  final password = TextEditingController();

  callApi() async {
    firebaseLoginBloc.signUp = BehaviorSubject<ApiResponseModel>();
    firebaseLoginBloc.signUpProcess(userName.text, password.text);
    firebaseLoginBloc.signUp.listen((data) {
      if (data.statusCode == 200) {
        Loader().hideLoader(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirebaseLoginPage(),
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
                hintText: "Email",
                labelText: "Email",
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
                child: Text('Sign up'),
                onPressed: () {
                  callApi();
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

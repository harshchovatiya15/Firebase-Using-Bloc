import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLogin {
  Future<ApiResponseModel> loginWithFirebaseAuth(
      String username, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final response = await auth.signInWithEmailAndPassword(
        email: username, password: password);
    if (response.user != null) {
      return ApiResponseModel("get data", 200, response.user);
    } else {
      return ApiResponseModel("No data found", 400, "");
    }
  }
}

final firebaseLogin = FirebaseLogin();

class FirebaseSignUp {
  Future<ApiResponseModel> signUpWithFirebaseAuth(
      String username, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final response = await auth.createUserWithEmailAndPassword(
        email: username, password: password);

    if (username != null && password != null) {
      return ApiResponseModel("get data", 200, response.user);
    } else {
      return ApiResponseModel("No data found", 400, "");
    }
  }
}

final firebaseSignUp = FirebaseSignUp();

class ApiResponseModel {
  ApiResponseModel(this.message, this.statusCode, this.data);
  String message;
  int statusCode;
  dynamic data;
}

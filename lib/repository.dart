import 'api_provider.dart';

class Repository {
  Future<ApiResponseModel> signUpWithFirebaseAuth(
          String username, String password) =>
      firebaseSignUp.signUpWithFirebaseAuth(username, password);

  Future<ApiResponseModel> loginWithFirebaseAuth(
          String username, String password) =>
      firebaseLogin.loginWithFirebaseAuth(username, password);
}

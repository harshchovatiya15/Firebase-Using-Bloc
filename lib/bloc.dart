import 'package:rxdart/rxdart.dart';

import 'api_provider.dart';
import 'repository.dart';

class FirebaseLoginBloc {
  final repository = Repository();

  BehaviorSubject<ApiResponseModel> signIn =
      BehaviorSubject<ApiResponseModel>();
  BehaviorSubject<ApiResponseModel> signUp =
      BehaviorSubject<ApiResponseModel>();


  void dispose() {
    signIn.close();
    signUp.close();
  }

  void clear() {
    signIn.sink.add(null);
    signUp.sink.add(null);
  }

  Future<void> signInProcess(String username, String password) async {
    final ApiResponseModel item =
        await repository.loginWithFirebaseAuth(username, password);
    signIn.sink.add(item);
  }

  Future<void> signUpProcess(String username, String password) async {
    final ApiResponseModel item =
        await repository.signUpWithFirebaseAuth(username, password);
    signUp.sink.add(item);
  }
}

final firebaseLoginBloc = FirebaseLoginBloc();

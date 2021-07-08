import 'package:login_bloc/bloc/auth/auth_services.dart';

class AuthRepository{

  AuthServices authService = AuthServices();
  Future<void> login({required String email, required String password}) async{
    print("Attempting Login...");
    await Future.delayed(Duration(seconds: 3));
    authService.signIn(email, password);


    // print("Logged In! ");
    throw Exception('Login Failed!');
  }
}


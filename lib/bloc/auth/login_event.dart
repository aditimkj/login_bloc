import 'package:login_bloc/bloc/auth/auth_repository.dart';

abstract class LoginEvent{}

class EmailChangedEvent extends LoginEvent{

  final String email;

  EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends LoginEvent{

  final String password;
  PasswordChangedEvent({required this.password});
}

class LoginSubmitted extends LoginEvent{

  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
  

}

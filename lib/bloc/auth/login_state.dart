import 'package:login_bloc/bloc/auth/form_submission_status.dart';

class LoginState{

  final String email;
  bool get isValidEmail => email.endsWith('@gmail.com');
  
  final String password;
  bool get isValidPassword => password.length > 8;

  final FormSubmissionStatus formStatus;




  LoginState({
   this.email = '',
   this.password = '',
   this.formStatus = const InitialFormStatus()
   });

//: assert(email != null && password != null)

  LoginState copyWith({
    String? email, 
    String? password,
    FormSubmissionStatus? formStatus,
    }) {
    return LoginState(
      
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus
      );
  }
}
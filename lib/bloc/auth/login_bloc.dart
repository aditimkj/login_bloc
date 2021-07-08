import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/auth/auth_repository.dart';
import 'package:login_bloc/bloc/auth/form_submission_status.dart';
import 'package:login_bloc/bloc/auth/login_event.dart';
import 'package:login_bloc/bloc/auth/login_state.dart';




class LoginBloc extends Bloc<LoginEvent, LoginState>{
  
  AuthRepository authRepo;
  LoginBloc(this.authRepo) : super(LoginState());

  

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    
    //INITIAL STATE EVENT 
    
    if(event is EmailChangedEvent){
    yield state.copyWith(email: event.email);
    // Email updated 
    }
    else if (event is PasswordChangedEvent){
      yield state.copyWith(password:  event.password);
      // Password updated 
    } else if (event is LoginSubmitted){
      yield state.copyWith(formStatus: FormSubmitting());
    // Form Submitted 
    try{
      await authRepo.login.call(email: event.email, password: event.password);
      yield state.copyWith(formStatus: SubmissionSuccess());
    }catch(e){
      yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
    }
    }

  }
}
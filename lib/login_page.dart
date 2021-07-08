import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/auth/form_submission_status.dart';
import 'package:login_bloc/bloc/auth/login_bloc.dart';
import 'package:login_bloc/bloc/auth/login_event.dart';
import 'package:login_bloc/bloc/auth/login_state.dart';
import 'package:login_bloc/homeScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(child: _loginForm());
      },
    )

        //  body: Container(child: _loginForm()),

        );
  }

  Widget _loginForm() {
    // return BlocListener<LoginBloc, LoginState>(
    //   listener: (context, state) {
    //     final formStatus = state.formStatus;
    //     if (formStatus is SubmissionFailed) {
    //       _showSnackBar(context, formStatus.exception.toString());
    //     }
    //     if (formStatus is SubmissionSuccess) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomeScreen()),
    //       );
    //     }
    //   },
    //   child:
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_emailField(), _passworldField(), _loginButton()],
        ),
      ),
      // ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Email',
      ),
      validator: (value) =>
          value!.endsWith('@gmail.com') ? null : 'Invalid Email',
      onChanged: (value) =>
          context.read<LoginBloc>().add(EmailChangedEvent(email: value)),
    );
  }

  Widget _passworldField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'Password',
      ),
      validator: (value) => (value!.length > 8) ? null : 'Invalid Password',
      onChanged: (value) =>
          context.read<LoginBloc>().add(PasswordChangedEvent(password: value)),
    );
  }

  Widget _loginButton() {
    return
        //BlocListener<LoginBloc, LoginState>(
        // listener: (context, state) {
        //   final formStatus = state.formStatus;
        //   if (formStatus is SubmissionFailed) {
        //     _showSnackBar(context, formStatus.exception.toString());
        //   }
        //   if (formStatus is SubmissionSuccess) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => HomeScreen()),
        //     );

        // }

        // if(formStatus is SubmissionFailed){
        //   _showSnackBar(context, 'Check Credentials');
        // }
        // },
        // child:
        ElevatedButton(
            onPressed: () {
              try {
                BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
                    email: _emailController.text,
                    password: _passwordController.text));

                    dynamic res = LoginSubmitted(
                    email: _emailController.text,
                    password: _passwordController.text);

                    if(res== true){
                        print("YOYO");
                        Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));

                    }

                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
              } catch (e) {
                _showSnackBar(context, e.toString());
              }
            },
            child: Text("Login"));
    //  );
    // return BlocBuilder<LoginBloc, LoginState>(
    //   builder: (context, state) {
    //     return state.formStatus is FormSubmitting
    //         ? CircularProgressIndicator()
    //         : ElevatedButton(
    //             onPressed: () {
    //               if (_formKey.currentState!.validate()) {
    //                 context.read<LoginBloc>().add(LoginSubmitted(email: _emailController.text, password: _passwordController.text));
    //               }
    //             },
    //             child: Text('Login'));
    //   },
    // );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackB = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackB);
  }
}

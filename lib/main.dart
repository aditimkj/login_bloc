import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/auth/auth_repository.dart';
import 'package:login_bloc/bloc/auth/login_bloc.dart';
import 'package:login_bloc/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context)=> LoginBloc(AuthRepository())
                )
          ],
          child: LoginPage()
          ), 
    
     // home: LoginPage()
    ); 
  }
}
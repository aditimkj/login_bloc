

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc/homeScreen.dart';


class AuthServices{

final FirebaseAuth _auth = FirebaseAuth.instance;

  

// Future<bool> verifyAuth(String email, String password) async{
// try{
// await _auth.signInWithEmailAndPassword(email: email, password: password);
//  print("$email");
//  print("$password"); 
//   return true;
// } on FirebaseAuthException catch(e){
//   print(e.message);
//   return false;
//   }
// }



Future <bool> signIn(String email, String password) async {    
    try {    
        // dynamic result  = await _auth.signInWithEmailAndPassword(email: email, password: password) as User;

        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        User user = result.user as User;
        print(user.uid);
        
        if(user != null){
           _auth.idTokenChanges().listen((User? user){
              if(user == null){
                print('User is currenly signed out');
              }
              else{
                print('User is signed in');
               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              }

           });
        }

        
        
        
        // assert(user != null);    
        // assert(await user.getIdToken() != null);    
        // final User currentUser = await _auth.currentUser!;    
        // assert(user.uid == currentUser.uid);    
        //return user;
        return true;    
    }on FirebaseAuthException catch (e) {     
        print(e.message);     
        throw Exception(e);   
    }    
}   
} 
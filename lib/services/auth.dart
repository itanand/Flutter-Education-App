import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_anand/models/user.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
   User _userFromFirebaseUser(FirebaseUser user){
     
     return user !=null ? User(userId: user.uid) : null;
     
   }
  
  Future signInWithEmailAndPassword(String email, String password) async {
    
    try{
        AuthResult result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
        FirebaseUser firebaseUser = result.user;
        return _userFromFirebaseUser(firebaseUser);
    }catch(e){
        print(e);
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async{
    try{
         AuthResult result = await _auth.createUserWithEmailAndPassword
         (email:email,  password: password );
         FirebaseUser firebaseUser = result.user;
         return _userFromFirebaseUser(firebaseUser);
    }catch(e){
     print(e.toString());
    }
  }
  
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in/google_sign_in.dart';


class LoginWithGoogel extends StatefulWidget {
  const LoginWithGoogel({Key? key}) : super(key: key);

  @override
  State<LoginWithGoogel> createState() => _LoginWithGoogelState();
}

class _LoginWithGoogelState extends State<LoginWithGoogel> {
  String useremail="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Googel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                  Text("User email :"),
                    Text(useremail)
              ],
            ),
          ),
           ElevatedButton(onPressed: () async{
              signInWithGoogle();
              setState(() {
                
              });
            },
             child:Text('login')),
          
           ElevatedButton(onPressed: (){},
             child:Text('logout'))
        ],
      ),
    ) ;
    
  }
 signInWithGoogle() async {
  // Trigger the authentication flow
   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
 AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  print(userCredential.user?.displayName);
  //useremail =googleUser.email;

  // Once signed in, return the UserCredential
 // return await FirebaseAuth.instance.signInWithCredential(credential);
}







}
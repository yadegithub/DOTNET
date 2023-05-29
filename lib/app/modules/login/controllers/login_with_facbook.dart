import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class LoginWitheFacbook extends StatefulWidget {
//   const LoginWitheFacbook({Key? key}) : super(key: key);

//   @override
//   State<LoginWitheFacbook> createState() => _LoginWitheFacbookState();
// }

// class _LoginWitheFacbookState extends State<LoginWitheFacbook> {
//   String useremail="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('login with facbook'),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("User email :"),
//                   Text(useremail)
//                 ],
//               ),
//             ),
//             ElevatedButton(onPressed: (){
//               signInWithFacebook();
//               setState(() {
                
//               });
//             },
//              child:Text('login')),
          
//            ElevatedButton(onPressed: (){},
//              child:Text('logout'))
//           ],
//         ),
//       ),
//     );
    
//   }
//   Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
   
//   final loginResult = await FacebookAuth.instance.login(
//     permissions:['email','public_profile']
//   );
  

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//  final userData = await FacebookAuth.instance.getUserData();

//  useremail =userData['email'];

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
// }

class LoginWitheFacbook extends StatefulWidget {
  const LoginWitheFacbook({Key? key}) : super(key: key);

  @override
  State<LoginWitheFacbook> createState() => _LoginWitheFacbookState();
}

class _LoginWitheFacbookState extends State<LoginWitheFacbook> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(_userData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Facebook Auth Project')),
        body: _checking
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userData != null
                      ? Text('name: ${_userData!['name']}')
                      : Container(),
                  _userData != null
                      ? Text('email: ${_userData!['email']}')
                      : Container(),
                  _userData != null
                      ? Container(
                          child: Image.network(
                              _userData!['picture']['data']['url']),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(color: Colors.blue,
                      child: Text(
                        _userData != null ? 'LOGOUT' : 'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _userData != null ? _logout : _login)
                ],
              )),
      ),
    );
  }
}

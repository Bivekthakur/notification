import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithFacebook extends StatelessWidget {
  static dynamic signInWithFacebook() async {
    // Trigger the authentication flow

    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
      result.accessToken?.token ?? '',
    );

// Sign in with Firebase
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

// Access user data
    final User? user = userCredential.user;

    String? name = user?.displayName;

    print("Name : ${name}");
    String? photoUrl = user?.photoURL;
    print("Photo : ${photoUrl}");

    String? email = user?.email;
    print("Email : ${email}");

    // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));

    // Sign in with the credential to Firebase Authentication
  }

  Future<void> _loginWithFacebook() async {
    try {
      // Log in with Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.status == LoginStatus.success) {
        // Access the user's information
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        print('Logged in with Facebook! User ID: ${accessToken.userId}');
      } else {
        print('Facebook login failed. Status: ${result.status}');
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Sign-In Example'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => signInWithFacebook(),
              child: Text('Sign in with Facebook'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                throw Exception();
              },
              child: Text('Crash'))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInWithFacebook extends StatelessWidget {
  Future<void> _loginWithFacebook() async {
    try {
      // Log in with Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.status == LoginStatus.success) {
        // Access the user's information
        final AccessToken accessToken = result.accessToken!;
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
      body: Center(
        child: ElevatedButton(
          onPressed: _loginWithFacebook,
          child: Text('Sign in with Facebook'),
        ),
      ),
    );
  }
}


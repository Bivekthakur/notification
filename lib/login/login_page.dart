import 'package:flutter/material.dart';
import 'package:notification/notification/notification_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value!.length < 4) {
                    return 'Enter your name';
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {
                        userNameController.clear();
                      },
                      icon: Icon(Icons.dangerous_rounded)),
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 2.0, color: Colors.orange)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: userPasswordController,
                validator: (value) {
                  if (value!.length < 4) {
                    return 'Enter your password';
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  // suffixIcon: ,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                      BorderSide(width: 2.0, color: Colors.orangeAccent)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(userNameController.text);
                      print(userPasswordController.text);

                      Map data = {
                        'username': userNameController.text,
                        'password': userPasswordController.text,
                      };

                      //NetworkRequest.submitLoginInfo(data);

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => NotificationPage()));
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

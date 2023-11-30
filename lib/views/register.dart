import 'package:flutter/material.dart';
import 'package:test/service/http_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String username;
  late String email_address;
  late String cin;
  late String password;
  late String password_confirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Username'),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Email Address'),
              onChanged: (value) {
                setState(() {
                  email_address = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'cin'),
              onChanged: (value) {
                setState(() {
                  cin= value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Confirm Password'),
              onChanged: (value) {
                setState(() {
                  password_confirm = value;
                });
              },
            ),
            InkWell(
              onTap: () async {
                // Check if passwords match before registration
                if (password == password_confirm) {
                  await HttpService.register(username, email_address, cin,
                      password, password_confirm, context);
                } else {
                  // Show error or alert about password mismatch
                  // Here you could use a SnackBar or showDialog to display an error
                }
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

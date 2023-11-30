import 'package:flutter/material.dart';
import 'package:test/service/http_service.dart';

class DashboardScreen extends StatelessWidget {
  Future<void> attemptLogout(context) async {
    try {
      await HttpService.logout(context);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to dashboard"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  attemptLogout(context), // Navigate to WelcomePage
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

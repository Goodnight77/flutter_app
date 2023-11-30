import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test/views/dashboard.dart';
import 'package:test/views/welcome.dart';


class HttpService {
  static const String baseUrl = "http://127.0.0.1:5000";

  static Future<void> login(String username, String password, context) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
    } catch (e) {}
  }

  static Future<void> register(
    String username,
    String emailAddress,
    String cin,
    String password,
    String passwordConfirm,
    context,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'emailAddress': emailAddress,
          'cin': cin,
          'password': password,
          'passwordConfirm': passwordConfirm,
        }),
      );

      if (response.statusCode == 201) {
        // Successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        // Failed registration
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // You can show an error message to the user or handle the failure scenario
      }
    } catch (e) {}
  }

  static Future<void> logout(context) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/logout'),
      );
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    } catch (e) {}
  }
}



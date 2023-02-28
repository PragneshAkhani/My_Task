import 'dart:convert';

import 'package:company_task/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("Enter Mobile Number"),
      centerTitle: true,
    ),
    body: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter mobile number',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => mobileNumber = value,
            ),
            ElevatedButton(
              onPressed: sendOTP,
              child: Text('Send OTP'),
            )
          ],
        ),
      ),
    );
  }

  var mobileNumber;
  var otp;
  var authToken = 'MW1LdTZRMFljdWpaYS9XTFZXRTRnZz09';
  Future<void> sendOTP() async {
    final uri1 =
        Uri.https('akshusofttech.com', '/philbrick/Philbrick_apis/app_login');
    final responseData = await https.post(
      uri1,
      headers: {
        'x-api-key': 'ehello',
        'Client-Service': 'secureclient',
        'Auth-Key': 'authforall',
      },
      body: {
        'mobile': mobileNumber,
      },
    );
    var data = json.decode(responseData.body);
    bool value = data['status'];

    print(value);

    if (value == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp(),
          ));
    }
  }
}

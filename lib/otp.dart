import 'dart:convert';
import 'package:company_task/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;


class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter otp"),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text(" Submit"))
        ],
      ),
    );
  }

  Future<void> verifyOTP() async {
    var mobileNumber;
    var otp;
    var authToken = 'MW1LdTZRMFljdWpaYS9XTFZXRTRnZz09';
    final uri1 =
        Uri.parse('akshusofttech.com/philbrick/Philbrick_apis/chk_otp');
    final responseData = await https.post(uri1, headers: {
      'x-api-key': 'ehello',
      'Client-Service': 'secureclient',
      'Auth-key': 'authforall',
      'auth-token': authToken,
    }, body: {
      'otp': otp,
      'mobile': mobileNumber,
    });
    final data = json.decode(responseData.body);
    print(data);
    setState(() {
      if (data['status'] == 'success') {
        authToken = data['data']['auth_token'];
        print('Go To Next Page');
      } else {
        print('Error');
      }
    });
  }
}

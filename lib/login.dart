import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qrapp/qrcode.dart';
import 'package:qrapp/registration.dart';
import 'package:http/http.dart'as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController rollno = TextEditingController();
  final TextEditingController password = TextEditingController();
  void login()async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode({
          'rollno': rollno.text,
          'password': password.text,
        }));
    var data=jsonDecode(response.body);
    print(data("null"));
    if(response.statusCode==200) {
      Navigator.push(context,MaterialPageRoute(builder: (context)=>QrCode()
    ));
      print('SUCCESS');
    } else(ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(data('SOMETHING WENT WRONG'))),
      )
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: Text('LOGIN'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: rollno,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'rollno',
                  hintText: 'rollno'
              ),  ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your  Password'
              ),  ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const QrCode()));
              },
              child: Text('Login'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(text: TextSpan(text: 'Register here',recognizer: TapGestureRecognizer
              ()..onTap=()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const Registration()))))
          ],
        ),
      ),
    );
  }
}

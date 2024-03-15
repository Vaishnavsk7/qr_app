import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qrapp/qrcode.dart';
import 'package:qrapp/registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Your Username'
              ),  ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(decoration: InputDecoration(
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

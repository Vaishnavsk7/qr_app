import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:qrapp/login.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController rollno = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool loading = false;

  void registration()async{
    Uri uri=Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
    headers: <String,String>{
      'Content-Type':'application/json;charset=UTF-8',
    },
    body: jsonEncode({
    'name':_name.text,
    'rollno':rollno.text,
    'username':_username.text,
    'password':password.text
    }));
    print(response.statusCode);
    print(response.body);
    var data=jsonDecode(response.body);
    print(data["message"]);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (Context)=> Login()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error'),));
    }
    print(_name.text);
    print(rollno.text);
    print(_username.text);
    print(password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller:_name,decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  hintText: 'Enter Your Full Name'
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller:rollno,decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'rollno',
                  hintText: 'Enter Your  Rollno'
              ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller:_username,decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Your Username'
              ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller:password,decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password'
              ),),
            ),
            SizedBox(height: 30,),
            TextButton(onPressed: registration, child: Text('Register',style: TextStyle(color: Colors.green),))
          ],
        ),
      ),
    );
  }
}

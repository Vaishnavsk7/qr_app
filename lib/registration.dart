import 'package:flutter/material.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
              child: TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  hintText: 'Enter Your Full Name'
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'DOB',
                  hintText: 'Enter Yourc  DOB'
              ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Your Username'
              ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password'
              ),),
            ),
            SizedBox(height: 30,),
            TextButton(onPressed: null, child: Text('Register',style: TextStyle(color: Colors.green),))
          ],
        ),
      ),
    );
  }
}

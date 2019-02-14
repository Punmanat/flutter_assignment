import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email), hintText: "email@example.com"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => this.username = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: "password"),
                obscureText: true,
                onSaved: (value) => this.password = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                   if(value.length < 8){
                    return "กรุณาระบุ password ให้ครบ 8 ตัว";
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), hintText: "confirm password"),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                  if (value != this.password) {
                    return "กรุณาระบุ password ให้เหมือนกัน";
                  }
                  if(value.length < 8){
                    return "กรุณาระบุ password ให้ครบ 8 ตัว";
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Continue"),
                onPressed: () {
                  _formkey.currentState.save();
                  if (_formkey.currentState.validate()) {
                    Navigator.pushNamed(context, "/");
                  }
                  if (this.username == 'admin') {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('user นี้มีในระบบแล้ว'),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String username;
  String password;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                "resources/cat.jpg",
                height: 200,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "User Id"),
                  onSaved: (value) {
                    print(value);
                    username = value;
                  },
                  validator: (value) {
                    //User Id
                    if (value.isEmpty) {
                      return "กรุณาระบุ user or password";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), hintText: "Password"),
                  obscureText: true,
                  onSaved: (value) {
                    password = value;
                  },
                  validator: (value) {
                    //password
                    if (value.isEmpty) {
                      return "กรุณาระบุ user or password";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {}
                    if (username == "admin" && password == "admin") {
                      Navigator.pushNamed(context, "/home");
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('user or password ไม่ถูกต้อง'),
                            );
                          });
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Register New Account",
                      style: TextStyle(color: Colors.green[400]),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

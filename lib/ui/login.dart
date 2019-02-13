import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}

class LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
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
              Image.asset("resources/cat.jpg", height: 200,),
              Container(
                margin: EdgeInsets.only(top:20),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "User Id"
                  ),
                  validator: (value){
                    //User Id
                    if(value.isEmpty){
                      return "กรุณาระบุ user or password";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: "Password"
                  ),
                  obscureText: true,
                  validator: (value){
                    //password
                    if(value.isEmpty){
                      return "กรุณาระบุ user or password";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: RaisedButton(
                  child: Text("Login"),
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                        Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("Processing Data")));
                      }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text("Register New Account", style: TextStyle(color: Colors.green[400]),),
                    onPressed: (){
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
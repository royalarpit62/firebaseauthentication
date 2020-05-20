import 'package:firebaseauthentication/services/auth.dart';
import 'package:firebaseauthentication/views/home.dart';
import 'package:firebaseauthentication/views/signin.dart';
import 'package:firebaseauthentication/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name,email, password;
  AuthService authService =new AuthService();
  bool _isLoading=false;
  signUp() async {
    if(_formKey.currentState.validate())
      setState(() {
        _isLoading =true;
      });
     authService.signUpWithEmailAndPassword(email, password).then((value)
    {
      if(value!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context)=>Home()
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body : _isLoading
            ? Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 30.0),
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Name" : null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Name',
                          hintText: 'Enter Name',

                          icon: Icon(Icons.people, color: Colors.grey)
                      ),

                      onChanged: (val){
                        name=val;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "enter email id" : null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            labelText: 'Email Id',
                            hintText: 'Enter Email Id',
                            icon: Icon(Icons.email, color: Colors.grey)
                        ),
                        onChanged: (val){
                          email=val;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.isEmpty ? "enter email id" : null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          icon: Icon(Icons.lock, color: Colors.grey)),
                      onChanged: (val){
                        password=val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        signUp();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30.0)),
                        height: 50.0,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 48,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have a account?",
                          style: TextStyle(
                              fontSize: 20.0, fontStyle: FontStyle.italic),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

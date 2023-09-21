import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Login_Pages/sqlhelper.dart';

import 'Login.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var formkey1 = GlobalKey<FormState>();
  var conname = TextEditingController();
  var conemail = TextEditingController();
  var pass = TextEditingController();
  var cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void Addnewuser(String name, String email, String password) async {
      var id = await SQLHelper.AddNewUser(name, email, password);
      if (id != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey1,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Create an new Account',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: conname,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Name is required";
                    } else
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: conemail,
                  validator: (email) {
                    if (email!.isEmpty &&
                        email.contains("@") &&
                        email.contains(".")) {
                      return "Enter valid email";
                    } else
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  validator: (pass1) {
                    if (pass1!.isEmpty || pass1.length < 6) {
                      return "Password must should be greater than 6";
                    } else
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: pass,
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  validator: (pass1) {
                    if (pass1!.isEmpty || pass1.length < 6) {
                      return "Password must should be greater than 6";
                    } else if (pass.text != cpass.text) {
                      return "Password not matched";
                    } else
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: cpass,
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.brown),
                onPressed: () async {
                  final valid1 = formkey1.currentState!.validate();
                  if (valid1) {
                    String uname = conemail.text;
                    String name = conname.text;
                    var data = await SQLHelper.userFound(name, uname);

                    if (data.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('User already exist')));
                    } else {
                      Addnewuser(conname.text, conemail.text, pass.text);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {},
                      ),
                      content: Text("Invalid username/password"),
                    ));
                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login!!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

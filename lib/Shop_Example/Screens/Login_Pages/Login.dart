import 'package:flutter/material.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Categories/category_screen.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Login_Pages/register.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Login_Pages/sqlhelper.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Splash_Screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  final TextEditingController conemail = TextEditingController();
  final TextEditingController conpass = TextEditingController();

  void logincheck(String email, String password) async {
    if (email == 'admin@gmail.com' && password == '123456') {
    } else {
      var data = await SQLHelper.CheckLogin(email, password);
      if (data.isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Categories()));
        print('Login Success');
      } else if (data.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
        print('Login faild');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hidepass = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("LOGIN PAGE"),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
              child: TextFormField(
                controller: conemail,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail_lock_outlined),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                validator: (text) {
                  if (text!.isEmpty ||
                      !text.contains('@') ||
                      !text.contains(".")) {
                    return "Enter valid Email!!!";
                  }
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 25),
                child: TextFormField(
                  controller: conpass,
                  obscureText: hidepass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (hidepass)
                            hidepass = false;
                          else
                            hidepass = true;
                        });
                      },
                      icon: Icon(hidepass
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return "Password length should be greater than 6";
                    }
                  },
                  textInputAction: TextInputAction.next,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
              child: MaterialButton(
                color: Colors.brown,
                textColor: Colors.white,
                height: 55,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    logincheck(conemail.text, conpass.text);
                  } else {}
                },
                child: const Text("LOGIN"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: const Text('Not a User? Register Here!!!'))
          ],
        ),
      ),
    );
  }
}

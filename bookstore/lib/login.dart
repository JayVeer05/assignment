import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  final _keyform = GlobalKey<FormState>();

  loginUser(BuildContext context) async {
    if (_keyform.currentState!.validate()) {
      if (email.text.toLowerCase() == "jay@gmail.com" &&
          pass.text.toLowerCase() == "12345678") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("plz enter valid user name or password")));

        // await Future.delayed(Duration(seconds: 1));
        // await Navigator.pushReplacementNamed(context, "/home");
      } else {
        return "null";
      }
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.purple.shade200,
        child: Container(
          child: SingleChildScrollView(
              child: Form(
                  key: _keyform,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Image.asset(
                          "assets/images/admin.png",
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo
                            // backgroundColor: Colors.purple.shade300//
                            ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text("UserName"),
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                    /* backgroundColor: Colors.purple.shade300*/
                                  ),
                                  hintText: ("Enter User Name"),
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                  prefixIcon: Icon(Icons.email)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "user name required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: pass,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text("Password"),
                                  labelStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.indigo,
                                    // backgroundColor: Colors.purple.shade300
                                  ),
                                  hintText: ("Enter User Password"),
                                  hintStyle: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                  prefixIcon: Icon(Icons.key)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password must required";
                                } else if (value.length < 8) {
                                  return "password must be 8 to 10 character required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          loginUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      )
                    ],
                  ))),
        ));
  }
}

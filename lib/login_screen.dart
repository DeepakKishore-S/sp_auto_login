import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharedpreference_task/homescreen.dart';
import 'package:sharedpreference_task/registry.dart';
import 'package:sharedpreference_task/shared.dart';

import 'constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String email = "";
  String pwd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  void getvalue() async {
    email = await SharedPref.getString(Email);
    pwd = await SharedPref.getString(Pwd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Login Screen",
            style: GoogleFonts.lato(fontSize: 30, color: Colors.pink)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Login", style: GoogleFonts.ptSerif(fontSize: 30)),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  height: 500,
                  width: 400,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(231, 246, 234, 238),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter your Email",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: mailcontroller,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter your Password",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ))),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (mailcontroller.text == email &&
                                passwordcontroller.text == pwd) {
                              await SharedPref.savebool(Authentication, true);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Invalid credentials6'),
                              );

                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.actor(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "If you don't have a account?",
                            style: TextStyle(fontSize: 17),
                          ),
                        
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistryScreen()));
                            },
                          
                            child: const Text(
                              "SignUp",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

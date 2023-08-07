import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharedpreference_task/constant.dart';
import 'package:sharedpreference_task/login_screen.dart';
import 'package:sharedpreference_task/shared.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedValue;
  String _name = "";
  String _email = "";
  String _pwd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  getValue() async {
    _name = await SharedPref.getString(Name);
    _email = await SharedPref.getString(Email);
    _pwd = await SharedPref.getString(Pwd);
    selectedValue = await SharedPref.getString(Roled);
    print(selectedValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome "),
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPref.savebool(Authentication, false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 400,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 6, 20, 99),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // alignment: Alignment.topLeft,
                      Text("Name:${_name}",
                          style: GoogleFonts.lora(
                              fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("EmailID:${_email}",
                          style: GoogleFonts.lora(
                              fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Password:${_pwd}",
                          style: GoogleFonts.lora(
                              fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Role:${selectedValue}",
                          style: GoogleFonts.lora(
                              fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

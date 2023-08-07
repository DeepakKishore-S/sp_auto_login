import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharedpreference_task/constant.dart';
import 'package:sharedpreference_task/homescreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sharedpreference_task/shared.dart';

class RegistryScreen extends StatefulWidget {
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  TextEditingController usenamecontroller = TextEditingController();
  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  List<String> role = ["Admin", "User"];
  String? selectedValue;
//String dropdownValue = 'admin';
  String _name = "";
  String _email = "";
  String _pwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Register Screen",
          style: GoogleFonts.lato(fontSize: 30, color: Colors.pink),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 700,
                  width: 600,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(222, 206, 167, 232),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.mukta(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: usenamecontroller,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email ID",
                          style: GoogleFonts.mukta(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: emailidcontroller,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Role",
                          style: GoogleFonts.mukta(fontSize: 25),
                        ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // TextField(
                        //   controller: usenamecontroller,
                        //   decoration: const InputDecoration(
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius:
                        //         BorderRadius.all(Radius.circular(20)))),
                        // ),
                        DropdownButton2<String>(
                          isExpanded: true,
                          value: selectedValue,
                          hint: Text(
                            "Role",
                            style: GoogleFonts.mukta(
                              fontSize: 25,
                            ),
                          ),
                          items: role.map((e) {
                            return DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e.toLowerCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                        // DropdownButtonHideUnderline(
                        //   child: DropdownButton<String>(
                        //     isExpanded: true,
                        //       value: dropdownValue,
                        //       onChanged: (String? newValue) {
                        //         setState(() {
                        //           dropdownValue = newValue!;
                        //         });
                        //       },
                        //       items: <String>['admin', 'user', 'officer'].map((String value) {
                        //         return DropdownMenuItem<String>(

                        //           value: value,
                        //           child: Text(value),
                        //         );
                        //       }).toList(),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: GoogleFonts.mukta(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () async{
                                  if (usenamecontroller.text.isNotEmpty &&
                                      emailidcontroller.text.isNotEmpty &&
                                      passwordcontroller.text.isNotEmpty &&
                                      selectedValue != null) {
                                  await  SharedPref.storeString(
                                        Name, usenamecontroller.text);
                                   await SharedPref.storeString(
                                        Email, emailidcontroller.text);
                                   await SharedPref.storeString(
                                        Pwd, passwordcontroller.text);
                                  await  SharedPref.storeString(
                                        Roled, selectedValue!);
                                  await  SharedPref.savebool(Authentication, true);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  } else {
                                    print("empty");
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.actor(fontSize: 25),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "If You already have a account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            TextButton(
                              onPressed: (
                                  // print();
                                  ) {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

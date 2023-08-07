import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharedpreference_task/registry.dart';

class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  TextEditingController keycontroller = TextEditingController();
  TextEditingController valuecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StoreData",
            style: GoogleFonts.lato(fontSize: 30, color: Colors.pink)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Data", style: GoogleFonts.ptSerif(fontSize: 30)),
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
                          "Key",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: keycontroller,
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
                          "value",
                          style: GoogleFonts.alegreyaSc(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: valuecontroller,
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
                          onPressed: () async {},
                          child: Text(
                            "Login",
                            style: GoogleFonts.actor(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Text(
                      //       "If you don't have a account?",
                      //       style: TextStyle(fontSize: 17),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     const RegistryScreen()));
                      //       },
                      //       child: const Text(
                      //         "SignUp",
                      //         style: TextStyle(fontSize: 17),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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

import 'package:flutter/material.dart';
import 'package:sharedpreference_task/constant.dart';
import 'package:sharedpreference_task/homescreen.dart';
import 'package:sharedpreference_task/shared.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sharedpreference_task/registry.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? login;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserlogin();
  }

  getUserlogin()async{
   login= await SharedPref.getbool(Authentication);
   setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: login??false?HomeScreen():const LoginScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

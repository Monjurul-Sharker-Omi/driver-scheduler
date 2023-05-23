import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_assignment/screens/homepage.dart';
import 'package:test_assignment/utils/apihandler.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    ));
  }

  Future<void> _login(context) async {
    var credentials = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = await api().postData(credentials, '/auth/login');
    var body = json.decode(res.body);
    if (res.statusCode == 200) { 
      print(body['data']['token']);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', body['data']['token']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      errorSnackBar(context, body.values.first[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  _login(context);

                  //getFromUser();
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 152, 24, 100),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text("Log In",
                      style: TextStyle(fontSize: 15, color: Colors.white  )),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

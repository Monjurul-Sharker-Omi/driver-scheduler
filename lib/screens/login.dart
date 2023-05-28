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
  bool _passwordVisible = true;
  

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
      errorSnackBar(context, body['message']);
    }
  }

@override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                    onPressed: (){
                       setState(() {
                       _passwordVisible = !_passwordVisible;
                        });
                    } , 
                    icon: Icon(_passwordVisible? Icons.visibility: Icons.visibility_off,
               ))
                    ),
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
                  width: width * 0.65,
                  decoration: BoxDecoration(
                    color: const Color(0xffF89818),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text("Log In",
                      style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: 'Euclid' )),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

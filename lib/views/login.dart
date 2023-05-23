import 'package:flutter/material.dart';
import 'package:genie_task/custome_widget/custome_title.dart';
import 'package:genie_task/views/home.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue,
                Colors.black,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 22),
                  Text(
                    'Shift App',
                    style: TextStyle(
                      color: Color(0XFFF89818),
                      fontWeight: FontWeight.w400,
                      fontSize: 44,
                      shadows: [
                        Shadow(
                          color: Colors.white,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.2,
                    child: Image.asset(
                      'assets/images/car.png',
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFF89818),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFF89818),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text('Password'),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFF89818),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFF89818),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 42, minWidth: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: CustomeTitle(
                        title: 'Login',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFFF89818),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      var response = await http.post(
        Uri.parse('https://dev-api.limadi.dk/api/v1/auth/login'),
        body: {
          "email": _emailController.text,
          "password": _passwordController.text,
        },
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}

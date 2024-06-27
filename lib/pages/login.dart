import 'package:app1/home.dart';
import 'package:app1/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController adminNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': adminNumberController.text,
        'password': passwordController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, navigate to the home page
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
    } else {
      // If the server did not return a 200 OK response, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to login. Please check your credentials and try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(height: 90),
            Image.asset(
              'images/Duka-removebg-preview.png',
              height: 120,
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: adminNumberController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  hintText: 'Enter your admin number',
                  hintStyle: GoogleFonts.outfit(fontSize: 17),
                  label: Text('Admin Number', style: GoogleFonts.outfit(fontSize: 15)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.outfit(fontSize: 17),
                  label: Text('Password', style: GoogleFonts.outfit(fontSize: 15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Login', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
                      isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : SvgPicture.asset(
                        'feather/log-in.svg',
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'Register your store here',
                style: GoogleFonts.outfit(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

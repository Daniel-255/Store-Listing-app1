import 'package:app1/home.dart';
import 'package:app1/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              SizedBox(height:170,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                      isDense: true, // Reduces the height of the input field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0), // Adjust border radius as needed
                      ),
                      // Prefix icon
                      hintText: 'Enter your admin number',
                      hintStyle: GoogleFonts.outfit(fontSize: 15),
                      label: Text('Admin Number', style: GoogleFonts.outfit(fontSize: 15),)
                  ),
                ),
              ),
              SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                      isDense: true, // Reduces the height of the input field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0), // Adjust border radius as needed
                      ),
                      // Prefix icon
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.outfit(fontSize: 15),
                      label: Text('Password', style: GoogleFonts.outfit(fontSize: 15),)
                  ),
                ),
              ),
              SizedBox(height:25),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                      // Action to perform when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: SizedBox(width: 100, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Login', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
                        SvgPicture.asset(
                          'feather/log-in.svg',  // Feather Icons SVG example
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ],
                    ),)
                ),
              ),
              SizedBox(height: 100,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              }, child: Text('Register your store here', style: GoogleFonts.outfit(
                fontSize: 14,
              ),))
            ],
          ),
      )
    );
  }
}

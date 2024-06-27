import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_outlined, size: 22,)),
        centerTitle: false,
        title: Text(
          'My Account',
          style: GoogleFonts.outfit(
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
                child: SvgPicture.asset(
                  'feather/log-out.svg',  // Feather Icons SVG example
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ),
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(243, 242, 241,70),
                ),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'feather/pie-chart.svg',  // Feather Icons SVG example
                          width: 24,
                          height: 24,
                          color: Colors.black,
                        ),
                        SizedBox(width: 14,),
                        Text(
                          'Reports',
                          style: GoogleFonts.outfit(
                            fontSize: 18
                          ),
                        )
                      ],
                    ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(243, 242, 241,70),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'feather/clipboard.svg',  // Feather Icons SVG example
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 14,),
                      Text(
                        'Notes',
                        style: GoogleFonts.outfit(
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(243, 242, 241,70),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'feather/users.svg',  // Feather Icons SVG example
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 14,),
                      Text(
                        'Sub admins',
                        style: GoogleFonts.outfit(
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}

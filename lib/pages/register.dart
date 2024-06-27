import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<String> _items = ['Electronics', 'Home accessories', 'Cosmetics', 'Pharmacy/Medical center', 'General Shop', 'Groceries store'];
  String? _selectedItem;

  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async {
    final String apiUrl = 'http://127.0.0.1:8000/api/register'; // Replace with your actual API URL

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'store_name': storeNameController.text,
        'owner_name': ownerNameController.text,
        'phone_number': phoneNumberController.text,
        'store_category': _selectedItem!,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
    } else {
      throw Exception('Failed to register user');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              SizedBox(height:60,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: storeNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    hintText: 'Enter Store name',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Store name', style: GoogleFonts.outfit(fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: ownerNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    hintText: 'Enter Owner name',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Owner name', style: GoogleFonts.outfit(fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    hintText: 'Enter your Phone number',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Phone number', style: GoogleFonts.outfit(fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedItem,
                  hint: Text('Select Store category', style: GoogleFonts.outfit(fontSize: 15)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  items: _items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: GoogleFonts.outfit(fontSize: 15)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
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
                    hintText: 'Create your password',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Create password', style: GoogleFonts.outfit(fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      registerUser();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Register', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
                      ],
                    ),)
                ),
              ),
              SizedBox(height: 30,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              }, child: Text('Login to your store', style: GoogleFonts.outfit(
                fontSize: 14,
              ),))
            ],
          ),
        )
    );
  }
}

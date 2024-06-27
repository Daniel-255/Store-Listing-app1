import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class reorderStocks extends StatefulWidget {
  const reorderStocks({super.key});

  @override
  State<reorderStocks> createState() => _reorderStocksState();
}

class _reorderStocksState extends State<reorderStocks> {
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
          'Re-order stocks',
          style: GoogleFonts.outfit(
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TZS 1,200,000', style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )),
                        SizedBox(height: 1,),
                        Text('Total reorder value', style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.normal
                        )),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'feather/filter.svg',
                          height: 26,
                          width: 26,
                          color: Colors.black,
                        ),
                    )
                  ],
                )
              ),
              SizedBox(height: 20,),
            ],
          ),
      ),
    );
  }
}

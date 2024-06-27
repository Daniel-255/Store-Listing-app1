import 'package:app1/home.dart';
import 'package:app1/pages/add_expenses.dart';
import 'package:app1/pages/create_purchase.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';

class purchases extends StatefulWidget {
  const purchases({super.key});

  @override
  State<purchases> createState() => _purchasesState();
}

class _purchasesState extends State<purchases> {
  List<String> items = List.generate(3, (index) => "Item ${index + 1}");
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
            'Purchases',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePurchase()));
                },
                child:
                SvgPicture.asset(
                  'feather/plus.svg',  // Feather Icons SVG example
                  width: 28,
                  height: 28,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TZS 120,000', style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 1,),
                    Text('Total purchases value', style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                    )),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: Key(items[index]), // Unique key for each item
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          items.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item dismissed")),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(33, 56, 165, 243)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(13),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(25),
                                        child: SvgPicture.asset(
                                          'feather/chevrons-up.svg',  // Feather Icons SVG example
                                          width: 26,
                                          height: 26,
                                          color: Colors.black,
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 2,),
                                      Text('TZS 40,000', style: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18
                                      ),),
                                      SizedBox(height: 2,),
                                      Text('Diclofenac, Liquid 250l', style: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15
                                      ),),
                                      SizedBox(height: 2,),
                                      Text('12th, June 2024 - Cash', style: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      )
                  );
                },
                ),
              )
            ],
          )
        )

    );

  }
}

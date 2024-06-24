import 'package:app1/home.dart';
import 'package:app1/pages/add_expenses.dart';
import 'package:app1/pages/create_stcok.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';

class allUnits extends StatefulWidget {
  const allUnits({super.key});

  @override
  State<allUnits> createState() => _allUnitsState();
}

class _allUnitsState extends State<allUnits> {
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
            'Stock',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateStock()));
                },
                child:
                SvgPicture.asset(
                  'feather/plus-circle.svg',  // Feather Icons SVG example
                  width: 26,
                  height: 26,
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
                      Text('TZS 11,322,000', style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 1,),
                      Text('Total stock value', style: GoogleFonts.outfit(
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 2,),
                                              Text('Panadol Extra', style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18
                                              ),),
                                              SizedBox(height: 2,),
                                              Text('TSH 12,000', style: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15
                                              ),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: (){

                                                },
                                                child: SvgPicture.asset(
                                                  'feather/trash.svg',  // Feather Icons SVG example
                                                  width: 26,
                                                  height: 26,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              SizedBox(width: 8,),
                                              InkWell(
                                                onTap: (){

                                                },
                                                child: SvgPicture.asset(
                                                  'feather/edit.svg',  // Feather Icons SVG example
                                                  width: 21,
                                                  height: 23,
                                                  color: Colors.blueGrey,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),SizedBox(height: 6,),
                                      Text('Reorder level: 213/500', style: GoogleFonts.outfit(
                                        fontSize: 12,
                                        color: Colors.green
                                      ),)
                                    ],
                                  )
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

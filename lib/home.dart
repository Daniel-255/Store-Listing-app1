import 'package:app1/pages/add_sale.dart';
import 'package:app1/pages/all_units.dart';
import 'package:app1/pages/create_stcok.dart';
import 'package:app1/pages/expenses.dart';
import 'package:app1/pages/notifications.dart';
import 'package:app1/pages/purchases.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WELCOME BACK,', style: GoogleFonts.outfit(
                    fontSize: 14, fontWeight: FontWeight.bold
                ),),
                Text('Listore', style: GoogleFonts.outfit(
                    fontSize: 14
                ),),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsPoint()));
              },
              child: SvgPicture.asset(
                'feather/bell.svg',  // Feather Icons SVG example
                width: 26,
                height: 26,
                color: Colors.black,
              ),
            )
          ],
        )
      ),
      body: Padding(padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>allUnits()));
                  },
                  child: Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        color: Color.fromRGBO(33, 150, 243 ,90),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(padding: EdgeInsets.all(14), child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'feather/list.svg',  // Feather Icons SVG example
                            width: 26,
                            height: 26,
                            color: Colors.white,
                          ),
                          SizedBox(height: 20,),
                          Text('2,155', style: GoogleFonts.outfit(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),

                          Text('Total units in stock', style: GoogleFonts.outfit(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                        ],
                      ),
                      )
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'feather/arrow-up-right.svg',
                              height: 26,
                              width: 26,
                              color: Colors.black,
                            ),
                            SizedBox(height: 20,),
                            Text('435', style: GoogleFonts.outfit(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Text('Total units sold', style: GoogleFonts.outfit(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
            SizedBox(height: 28,),
            Row(
              children: [
                Text('Inventory', style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
            SizedBox(height: 22,),
            Container(
              height: 145,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: EdgeInsets.all(12), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Reorder stocks',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 10,),
                      Text('No. of items',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('532',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Text('12',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height:15),
                  ElevatedButton(
                    onPressed: () {
                      // Action to perform when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: SizedBox(width: 105, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('View Stocks', style: GoogleFonts.outfit(color: Colors.black)),
                        SvgPicture.asset(
                          'feather/arrow-right.svg',  // Feather Icons SVG example
                          width: 25,
                          height: 25,
                          color: Colors.black,
                        ),
                      ],
                    ),)
                  )

                ],
              ),)
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 56,
        child: BottomAppBar(
          elevation: 3,
          color: Colors.white,
          shape: CircularNotchedRectangle(), // Creates a notch for the FAB
          notchMargin: 0, // Margin around the notch
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>expenses()));
                },
                child:
                SvgPicture.asset(
                  'feather/arrow-up.svg',  // Feather Icons SVG example
                  width: 26,
                  height: 26,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateStock()));
                },
                child: SvgPicture.asset(
                  'feather/plus-circle.svg',  // Feather Icons SVG example
                  width: 26,
                  height: 26,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>purchases()));
                },
                child: SvgPicture.asset(
                  'feather/pocket.svg',  // Feather Icons SVG example
                  width: 26,
                  height: 26,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: (){},
                child: SvgPicture.asset(
                  'feather/user.svg',  // Feather Icons SVG example
                  width: 26,
                  height: 26,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>addSale()));
            // Action when FAB is pressed
          },
          child: Text('Add Sale', style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
          elevation: 10,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      )
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

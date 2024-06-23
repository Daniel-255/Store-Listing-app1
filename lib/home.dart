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
            SvgPicture.asset(
              'feather/bell.svg',  // Feather Icons SVG example
              width: 26,
              height: 26,
              color: Colors.black,
            ),
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
                Container(
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
                Container(
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
              height: 140,
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
                      Text('Reorder stock',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 10,),
                      Text('No. of items',
                        style: GoogleFonts.outfit(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
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
                  SizedBox(height:10),
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
                    child: SizedBox(width: 100, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('View Store', style: GoogleFonts.outfit()),
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
              SvgPicture.asset(
                'feather/user.svg',  // Feather Icons SVG example
                width: 26,
                height: 26,
                color: Colors.black,
              ),
              SvgPicture.asset(
                'feather/plus-circle.svg',  // Feather Icons SVG example
                width: 26,
                height: 26,
                color: Colors.black,
              ),
              SvgPicture.asset(
                'feather/layers.svg',  // Feather Icons SVG example
                width: 26,
                height: 26,
                color: Colors.black,
              ),
              InkWell(
                onTap: (){},
                child: SvgPicture.asset(
                  'feather/arrow-up.svg',  // Feather Icons SVG example
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
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      )
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

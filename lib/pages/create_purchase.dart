import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';


class createPurchase extends StatefulWidget {
  const createPurchase({super.key});

  @override
  State<createPurchase> createState() => _createPurchaseState();
}

class _createPurchaseState extends State<createPurchase> {
  final List<String> __items = ['Cash', 'Lipa namba', 'Bank', 'Cheque','Debt'];
  String? __selectedItem;
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
            'Register a purchase',
            style: GoogleFonts.outfit(
                fontSize: 17,
                fontWeight: FontWeight.normal
            ),
          )
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(height:60,),
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
                    hintText: 'Enter name of item',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Item name', style: GoogleFonts.outfit(fontSize: 15),)
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
                    hintText: 'Enter vendor name',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Vendor name', style: GoogleFonts.outfit(fontSize: 15),)
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
                    hintText: 'Enter purchase amount',
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                    label: Text('Purchase amount', style: GoogleFonts.outfit(fontSize: 15),)
                ),
              ),
            ),
            SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DropdownButtonFormField<String>(
                value: __selectedItem,
                hint: Text('Payment type', style: GoogleFonts.outfit(fontSize: 15)),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                ),
                items: __items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: GoogleFonts.outfit(fontSize: 15)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    __selectedItem = newValue;
                  });
                },
              ),
            ),
            SizedBox(height:25),
            TextField(
              // controller: _controller,
              maxLines: null, // Allow the TextField to grow as needed
              minLines: 3, // Set a minimum number of lines
              keyboardType: TextInputType.multiline, // Use a multiline input type
              decoration: InputDecoration(
                  hintText: 'Enter purchase note',
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                  isDense: true, // Reduces the height of the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0), // Adjust border radius as needed
                  ),
                  // Prefix icon
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Purchase note', style: GoogleFonts.outfit(fontSize: 15),)
              ),
            ),
            SizedBox(height:25),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  onPressed: () {
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
                      Text('Register', style: GoogleFonts.outfit(fontSize: 17, color:Colors.white)),
                      // SvgPicture.asset(
                      //   'feather/arrow-right.svg',  // Feather Icons SVG example
                      //   width: 25,
                      //   height: 25,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';


class CreateStock extends StatefulWidget {
  const CreateStock({super.key});

  @override
  State<CreateStock> createState() => _CreateStockState();
}

class _CreateStockState extends State<CreateStock> {
  // List of items for the dropdown
  final List<String> _items = ['iTel', 'Sony', 'Samsung'];
  final TextEditingController _controller = TextEditingController();
  // The currently selected item
  String? _selectedItem;
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
          'Create Stock',
          style: GoogleFonts.outfit(
            fontSize: 17,
            fontWeight: FontWeight.normal
          ),
        )
      ),
      body: Padding(padding: EdgeInsets.all(13), child: Column(
        children: [
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
                  hintText: 'Item name',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Enter item name', style: GoogleFonts.outfit(fontSize: 15),)
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
                  hintText: 'Item Model Number',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Enter item model number', style: GoogleFonts.outfit(fontSize: 15),)
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
                  hintText: 'Item Quantity',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Enter the item quantity', style: GoogleFonts.outfit(fontSize: 15),)
              ),
            ),
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: DropdownButtonFormField<String>(
              value: _selectedItem,
              hint: Text('Select Supplier', style: GoogleFonts.outfit(fontSize: 15)),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                // contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
          SizedBox(height:25),
          TextField(
            controller: _controller,
            maxLines: null, // Allow the TextField to grow as needed
            minLines: 3, // Set a minimum number of lines
            keyboardType: TextInputType.multiline, // Use a multiline input type
            decoration: InputDecoration(
              hintText: 'Enter your description here',
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                isDense: true, // Reduces the height of the input field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0), // Adjust border radius as needed
                ),
                // Prefix icon
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                label: Text('Item Description', style: GoogleFonts.outfit(fontSize: 15),)
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
                    Text('Enter stock', style: GoogleFonts.outfit(fontSize: 17, color:Colors.white)),
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
      ),)
    );
  }
}

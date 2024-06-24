import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';

class addSale extends StatefulWidget {
  const addSale({super.key});

  @override
  State<addSale> createState() => _addSaleState();
}

class _addSaleState extends State<addSale> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }
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
            'Add sale',
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
          SizedBox(height: 20,),
          DropdownSearch<String>(
            items: ["Sales", "Expenses", "Purchases", "Inventory", "Marketing","Sales", "Expenses", "Purchases", "Inventory", "Marketing","Sales", "Expenses", "Purchases", "Inventory", "Marketing"],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Item",
                labelStyle: GoogleFonts.outfit(fontSize: 15),
                hintText: "Search or select item",
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  hintText: "Search here",
                  hintStyle: GoogleFonts.outfit(fontSize: 15)
                ),
              ),
            ),
            onChanged: (value) {
              print("Selected: $value");
            },
          ),
        SizedBox(height: 26,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 220,
            height: 60,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.center,
              controller: TextEditingController(text: _quantity.toString()),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              onSubmitted: (value) {
                int? newValue = int.tryParse(value);
                if (newValue != null && newValue > 0) {
                  setState(() {
                    _quantity = newValue;
                  });
                } else {
                  // Revert to the previous value if invalid input
                  setState(() {
                    _quantity = 1;
                  });
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.black,
              icon: Icon(Icons.remove, color: Colors.white,),
              onPressed: _decrementQuantity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.add,  color: Colors.white,),
              onPressed: _incrementQuantity,
            ),
          )

        ],
      ), SizedBox(height:26),
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
                  hintText: 'Discount amount',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Specify discount', style: GoogleFonts.outfit(fontSize: 15),)
              ),
            ),
          ),
          SizedBox(height:25),
          TextField(
            // controller: _controller,
            maxLines: null, // Allow the TextField to grow as needed
            minLines: 3, // Set a minimum number of lines
            keyboardType: TextInputType.multiline, // Use a multiline input type
            decoration: InputDecoration(
                hintText: 'Enter discount note',
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
                isDense: true, // Reduces the height of the input field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0), // Adjust border radius as needed
                ),
                // Prefix icon
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                label: Text('Discount note', style: GoogleFonts.outfit(fontSize: 15),)
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
                  ],
                ),)
            ),
          ),
      ],),),
    );
  }
}

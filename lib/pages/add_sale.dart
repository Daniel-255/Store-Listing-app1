import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddSale extends StatefulWidget {
  const AddSale({super.key});

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  int _quantity = 1;
  final TextEditingController discountAmountController = TextEditingController();
  final TextEditingController discountNoteController = TextEditingController();
  String? _selectedItem;
  bool isLoading = false;

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

  Future<void> addSale() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/sales'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'item': _selectedItem,
        'quantity': _quantity,
        'discount_amount': double.tryParse(discountAmountController.text),
        'discount_note': discountNoteController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add sale. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, size: 22),
        ),
        title: Text(
          'Add sale',
          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(height: 20),
            DropdownSearch<String>(
              items: ["Sales", "Expenses", "Purchases", "Inventory", "Marketing"],
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
                    hintStyle: GoogleFonts.outfit(fontSize: 15),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
            SizedBox(height: 26),
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
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: _decrementQuantity,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: _incrementQuantity,
                  ),
                ),
              ],
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: discountAmountController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  hintText: 'Discount amount',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Specify discount', style: GoogleFonts.outfit(fontSize: 15)),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: discountNoteController,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter discount note',
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                label: Text('Discount note', style: GoogleFonts.outfit(fontSize: 15)),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : addSale,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Add', style: GoogleFonts.outfit(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateStock extends StatefulWidget {
  const CreateStock({Key? key}) : super(key: key);

  @override
  _CreateStockState createState() => _CreateStockState();
}

class _CreateStockState extends State<CreateStock> {
  final List<String> _items = ['iTel', 'Sony', 'Samsung'];
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController modelNumberController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? _selectedSupplier;
  bool isLoading = false;

  Future<void> createStock() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/stock'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'item_name': itemNameController.text,
          'model_number': modelNumberController.text,
          'quantity': int.tryParse(quantityController.text) ?? 0,
          'supplier': _selectedSupplier,
          'description': descriptionController.text,
        }),
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 201) {
        Navigator.pop(context); // Navigate back if successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Stock was added succesffully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create stock. Please try again.')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
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
          'Create new Stock',
          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Item name',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Enter item name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: modelNumberController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Item Model Number',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Enter item model number',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Item Quantity',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Enter the item quantity',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedSupplier,
              hint: Text('Select Supplier', style: GoogleFonts.outfit(fontSize: 15)),
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
                  _selectedSupplier = newValue;
                });
              },
            ),
            SizedBox(height: 25),
            TextField(
              controller: descriptionController,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter your description here',
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Item Description',
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isLoading ? null : createStock,
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
                    : Text(
                  'Enter stock',
                  style: GoogleFonts.outfit(fontSize: 17, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

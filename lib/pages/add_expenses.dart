import 'package:app1/home.dart';
import 'package:app1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addExpenses extends StatefulWidget {
  const addExpenses({super.key});

  @override
  State<addExpenses> createState() => _addExpensesState();
}

class _addExpensesState extends State<addExpenses> {
  final List<String> __items = ['Cash', 'Lipa namba', 'Bank', 'Cheque', 'Debt'];
  final List<String> _items = ['Utilities', 'Rent', 'Supplies', 'Salary and wages', 'Maintenance', 'Marketing and Advertising', 'Travel', 'Others'];
  final TextEditingController amountController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController discountNoteController = TextEditingController();

  String? _selectedCategory;
  String? _selectedPaymentType;
  bool isLoading = false;

  Future<void> registerExpense() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/expenses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'amount': amountController.text,
        'payment_type': _selectedPaymentType,
        'category': _selectedCategory,
        'vendor_name': vendorNameController.text,
        'discount_note': discountNoteController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 201) {
      // If the server returns a 201 Created response, navigate to the home page
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
    } else {
      // If the server did not return a 201 Created response, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register expense. Please try again.')),
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
        centerTitle: false,
        title: Text(
          'Register an expense',
          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  hintText: 'Enter Amount of the expenditure',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Expense amount', style: GoogleFonts.outfit(fontSize: 15)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DropdownButtonFormField<String>(
                value: _selectedPaymentType,
                hint: Text('Payment type', style: GoogleFonts.outfit(fontSize: 15)),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                items: __items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: GoogleFonts.outfit(fontSize: 15)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentType = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: DropdownButtonFormField<String>(
                value: _selectedCategory,
                hint: Text('Select category', style: GoogleFonts.outfit(fontSize: 15)),
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
                onChanged: (String? _newValue) {
                  setState(() {
                    _selectedCategory = _newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextField(
                controller: vendorNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  hintText: 'Enter vendor name',
                  hintStyle: GoogleFonts.outfit(fontSize: 15),
                  label: Text('Vendor name', style: GoogleFonts.outfit(fontSize: 15)),
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
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: isLoading ? null : registerExpense,
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
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Register', style: GoogleFonts.outfit(fontSize: 17, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

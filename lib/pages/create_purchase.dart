import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class CreatePurchase extends StatefulWidget {
  const CreatePurchase({Key? key}) : super(key: key);

  @override
  State<CreatePurchase> createState() => _CreatePurchaseState();
}

class _CreatePurchaseState extends State<CreatePurchase> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _vendorNameController = TextEditingController();
  final TextEditingController _purchaseAmountController = TextEditingController();
  final TextEditingController _purchaseNoteController = TextEditingController();
  String? _selectedPaymentType;
  final List<String> _paymentTypes = ['Cash', 'Lipa namba', 'Bank', 'Cheque', 'Debt'];
  bool _isSaving = false;

  Future<void> _registerPurchase() async {
    // Replace with your actual API endpoint URL
    var url = Uri.parse('http://127.0.0.1:8000/api/add-purchase');

    setState(() {
      _isSaving = true;
    });

    try {
      var response = await http.post(
        url,
        body: {
          'item_name': _itemNameController.text,
          'vendor_name': _vendorNameController.text,
          'purchase_amount': _purchaseAmountController.text,
          'payment_type': _selectedPaymentType!,
          'purchase_note': _purchaseNoteController.text,
        },
      );

      if (response.statusCode == 201) {
        // Successful request
        // Handle success case
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Purchase was added succesffully')),
        );
        // Optionally, navigate to another screen or show a success message
      } else {
        // Request failed
        // Handle error case
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add purchase. Please try again.')),
        );
        // Optionally, show an error message to the user
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occured, Please try again.')),
      );
      // Handle network errors or other exceptions
      print('Error: $e');
      // Optionally, show an error message to the user
    } finally {
      setState(() {
        _isSaving = false;
      });
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
          'Register a purchase',
          style: GoogleFonts.outfit(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            SizedBox(height: 60),
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Enter name of item',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Item name',
                labelStyle: GoogleFonts.outfit(fontSize: 15),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _vendorNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Enter vendor name',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Vendor name',
                labelStyle: GoogleFonts.outfit(fontSize: 15),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _purchaseAmountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Enter purchase amount',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Purchase amount',
                labelStyle: GoogleFonts.outfit(fontSize: 15),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedPaymentType,
              hint: Text('Payment type', style: GoogleFonts.outfit(fontSize: 15)),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              items: _paymentTypes.map((String item) {
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
            SizedBox(height: 25),
            TextField(
              controller: _purchaseNoteController,
              maxLines: null,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                hintText: 'Enter purchase note',
                hintStyle: GoogleFonts.outfit(fontSize: 15),
                labelText: 'Purchase note',
                labelStyle: GoogleFonts.outfit(fontSize: 15),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _registerPurchase,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _isSaving
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: GoogleFonts.outfit(fontSize: 17, color: Colors.white),
                    ),
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

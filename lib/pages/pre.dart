import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feather_icons/feather_icons.dart';


class pre extends StatefulWidget {
  const pre({super.key});

  @override
  State<pre> createState() => _preState();
}

class _preState extends State<pre> {
  final List<Tab> tabs = [
    Tab(icon: Icon(Icons.home), text: 'Home'),
    Tab(icon: Icon(Icons.search), text: 'Search'),
    Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
    Tab(icon: Icon(Icons.person), text: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('BottomAppBar with Tabs'),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
              Center(child: Text('Notifications Page')),
              Center(child: Text('Profile Page')),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.red, // Background color of the BottomAppBar
            shape: CircularNotchedRectangle(), // Optional notch shape for FAB
            child: TabBar(
              tabs: tabs,
              labelColor: Colors.white, // Selected tab label color
              unselectedLabelColor: Colors.grey, // Unselected tab label color
              indicatorColor: Colors.transparent, // No indicator needed
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Action when FAB is pressed
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue, // FAB background color
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}

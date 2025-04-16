import 'package:flutter/material.dart';
import 'package:our_finances/Screens/new_entry_screen.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          NewEntryScreen()
        ],
      ),
    );
  }

}
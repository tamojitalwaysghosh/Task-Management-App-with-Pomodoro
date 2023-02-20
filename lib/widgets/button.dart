import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function()? onTap;
  const MyButton(
      {super.key, required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49,
        width: 92,
        padding: EdgeInsets.all(8),
        //margin: EdgeInsets.only(right: 20),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.w500,
                fontSize: 20,
                fontFamily: 'Comfortaa'),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

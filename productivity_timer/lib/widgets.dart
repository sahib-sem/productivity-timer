import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback onPressed;
  final String text;

  ProductivityButton({super.key, required this.color, required this.size, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: size,
      color: color,
      child: Text(
        text , 
        style:  TextStyle(color:Colors.white),),
      onPressed: onPressed);
  }
}

class SettingButton extends StatelessWidget {
  
  Color color;
  String text;
  int value;
  SettingButton(this.color , this.text, this.value);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:(){} ,
      color: color,
      child: Text(text , 
      style: TextStyle(color: Colors.white),
      ),
    
      
      );
  }
}
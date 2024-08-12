import 'package:flutter/material.dart';
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key,this.color,this.function,required this.text,this.colorText });
  final  Color? color;
 final Function()? function;
  final Color? colorText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding (
        padding:
        const EdgeInsets.symmetric(
            vertical: 6.0,horizontal: 5.0),
        child: Material(
          elevation: 2.0,
          color: color,
          borderRadius:
          BorderRadius.circular(
              15.0),
          child: MaterialButton (
            shape:
            RoundedRectangleBorder (

              borderRadius: BorderRadius.circular(15),),
            onPressed:function,
            minWidth: 95,
            height: 35.0,
            child: Text(
              text,
              style: TextStyle(
                  color: colorText,
                  fontSize: 14),
            ),
          ),
        ));
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/uniti/decoration.dart';


class CustomDate extends StatelessWidget {
   CustomDate({Key? key,required this.dateInput,required this.width,required this.onChanged, this.validator}) : super(key: key);
  final TextEditingController dateInput;
  final double width;
  var onChanged;
   final FormFieldValidator<dynamic>? validator;

   @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: width,
      // height: 35,
      child: TextFormField(
        keyboardType: TextInputType.none,
        controller: dateInput,
        style:  TextStyle(
            color: ColorManager.secondaryColor,

            fontSize: 18),
        cursorColor: ColorManager.secondaryColor,
        textAlign: TextAlign.start,
        validator:validator==null ? (value) {
          if (value!.isEmpty) {
            return "Required_Field";
          }
          return null;
        }: validator ,
        onTap: onChanged,
        onChanged: (value){
          print(dateInput.toString());
        },
        decoration: KTextField1Decoration.copyWith(
          filled: true,
          fillColor: ColorManager.grey,
          hintText: 'YY-MM-DD',
          prefixIcon:  Icon(
            Icons.calendar_today,
            color: ColorManager.secondaryColor,
            size: 17,
          ),
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xFFD2D1D1),
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }


}

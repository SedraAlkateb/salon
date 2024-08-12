/*
import 'package:blueocean_travel/features/auth/imports/sign_in_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../translations/locale_keys.g.dart';
import '../theme/app_theme.dart';

class PhoneField  extends StatelessWidget {
  PhoneField({Key? key,required this.phoneController,this.readOnly}) : super(key: key);
  final TextEditingController phoneController;


  final bool? readOnly ;
  @override
  Widget build(BuildContext context) {
    return   IntlPhoneField(
      readOnly: readOnly??false,
      controller: phoneController,
      disableLengthCheck: true,
      dropdownTextStyle: const TextStyle(
          color:  Colors.black),

      style: const TextStyle(
          color: Colors.black, fontSize: 14),
      cursorColor: Colors.black,

      textAlign: TextAlign.start,
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color:  Colors.black,
      ),

      decoration: InputDecoration(
        filled: true,
        fillColor: filedColor,
        focusColor:  filedColor,
        hoverColor:  filedColor,
        // suffixIcon:suffixIcon ,
        border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right:Radius.circular(20) ),),
        //border: UnderlineInputBorder(),
        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right:Radius.circular(20)),borderSide: BorderSide(color: myGrays)),
        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right:Radius.circular(20)),borderSide: BorderSide(color: myGrays)) ,

      ),
      showDropdownIcon: true,
      dropdownIconPosition:
      IconPosition.leading,
      initialCountryCode: 'SY',
      validator: (value) {
        if (value!.number.isEmpty) {
          return LocaleKeys.Required_Field
              .tr();
        }
        /*
    if(value.number.length>10 )
      return LocaleKeys.length_phone.tr();
    if(value.number.length==10 && !value.number.startsWith('0'))
      return LocaleKeys.format_phone.tr();
    if(value.number.length == 9 && !value!.number.startsWith('9'))
      return LocaleKeys.format_phone.tr();
    if(value.number.length < 9&&value!.number.startsWith('9')){
      return "less then 9";
    }
    if(value.number.length < 10&&value!.number.startsWith('0')){
      return "less then 10 ";
    }
   */
        return null;
      },
      onCountryChanged: (country) {
        BlocProvider.of<AuthBloc>(context).add(PhoneEvent(submit: country.dialCode));
      },
    );
  }
}

 */
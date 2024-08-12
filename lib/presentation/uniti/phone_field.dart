import 'package:salon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField  extends StatelessWidget {
  const PhoneField({super.key,required this.phoneController,this.readOnly});
  final TextEditingController phoneController;


  final bool? readOnly ;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: AppPadding.p20,right: AppPadding.p20,left: AppPadding.p20),
      child: IntlPhoneField(
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

        showDropdownIcon: true,
        dropdownIconPosition:
        IconPosition.leading,
        initialCountryCode: 'UE',

        validator: (value) {
          if (value!.number.isEmpty) {
            return "this_field_is_required";
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
        onChanged: (value) {
       //   BlocProvider.of<AuthBloc>(context).phoneNumber=value.countryCode;
        },
        onCountryChanged: (country) {
       //   BlocProvider.of<AuthBloc>(context).phoneNumber="+${country.dialCode}";
        },
      ),
    );
  }
}

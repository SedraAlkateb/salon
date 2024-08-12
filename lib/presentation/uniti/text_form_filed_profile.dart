import 'package:salon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
class TextFormFiledProfile extends StatelessWidget {
  const TextFormFiledProfile({
    super.key,required this.hint,this.controller,this.textInputType,this.validator,this.onTap,this.onChange});
 final String hint;
  final TextInputType ? textInputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
final Function(String)?  onTap;
  final Function()?  onChange;
  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.only(top: AppPadding.p20,right: AppPadding.p20,left: AppPadding.p20),
        child: TextFormField(
          onChanged:onTap ,
          onTap:onChange ,

          keyboardType: textInputType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              labelText: hint
          ),
        )
    );
  }
}

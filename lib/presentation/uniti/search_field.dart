import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
class SearchField extends StatelessWidget {
   const SearchField({super.key,required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return   Padding(

      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
      child: TextFormField(

        controller: searchController,
        onChanged: (value) {
        } ,
        decoration: InputDecoration(
          fillColor: ColorManager.white,
            border:InputBorder.none,
            isDense: true,
            //  contentPadding: EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            hintText: 'Search here....',

            hintStyle: const TextStyle(fontSize: 12,overflow: TextOverflow.fade,),

            prefixIcon: Icon(Icons.search,color: ColorManager.kSecondColor,size: AppSize.s28,)
        ),
      ),
    );
  }
}

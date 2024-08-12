import 'package:salon/app/constants.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key,required this.offers});
  final String offers;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(
      width: size.width*0.2,
      height: size.height*0.2,
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //    borderRadius: BorderRadius.circular(15),
          color: ColorManager.filedColor,
          //color: Colors.deepOrange,
          boxShadow: [
            BoxShadow(
              color: ColorManager.myGrays,
              offset: const Offset(0.0, 2.0),
              blurRadius: 2,
            ),
          ]),
      child:InkWell(
        onTap: (){
          _showImageDialog(context, offers);
        },
        child: ClipOval(

        //  borderRadius: BorderRadiusDirectional.circular(20),
          child:
          SizedBox(
            width: size.width*0.2,
            height: size.height*0.2,
            child: Image.network(

                  //${Constants.baseUrl}
              offers,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          ),

        ),
      ),

    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child:ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                child: Image.network(
                  '${Constants.baseUrl}$imageUrl',
                  //     fit: BoxFit.cover,
                ),
              ),)
        );
      },
    );
  }

}

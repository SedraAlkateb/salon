// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
final ImagePicker imagePicker = ImagePicker();

Widget image(String image, {BoxShape box =BoxShape.rectangle}){
  return  ClipRRect(

    borderRadius: BorderRadius.circular(60),
    child:Image.network(
      height: 120,
      width: 120,
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print(error);
        return const Text("No network !");
      },
    ),

  );
}
Widget imageProduct(String image, {BoxShape box =BoxShape.rectangle}){
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: 0),
    child: Image.network(
      height: 300,
      //    width: 100,
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print(error);
        return const Text("No network !");
      },
    ),
  );
}

Future<File?> pickImage() async {
  try {
    final image1 = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image1 == null) return null ;
    final imageTemporary = File(image1.path);

    return imageTemporary;
  } on PlatformException catch (e) {
    print("object $e");
  }
  return null;
}

Future<File?> selectImage(BuildContext context) async {
  final XFile? selectedImageFile =
  await imagePicker.pickImage(source: ImageSource.gallery);
  if (selectedImageFile != null) {
    print(selectedImageFile.path);
    return File(selectedImageFile.path);
  }
  return null;
}
showDialogFunc(context,String imageProf) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(

          type: MaterialType.transparency,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 5,),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: image(imageProf),
                ),

              ],),

          ),
        ),

      );
    },
  );
}
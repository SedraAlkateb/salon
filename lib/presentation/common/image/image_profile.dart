import 'dart:io';

import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/image/image.dart' as y;
import 'package:flutter/material.dart';
class ImageProfile extends StatelessWidget {
  ImageProfile({super.key, this.image, this.updateImage});
final  String? image;
  final String? updateImage;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child:   Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  child: image !=
                      null
                      ? InkWell(
                    onTap: () async {

                      y.showDialogFunc(
                          context, image??"");
                    },
                    child:
                    updateImage!=null?
                    Container(
                      width: AppSize.s150,
                      height: AppSize.s150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[100],
                      ),
                      child: y.image(updateImage??""),
                    ):
                    Container(
                      width: AppSize.s150,
                      height: AppSize.s150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[100],
                          image: DecorationImage(image:
                          FileImage(File(updateImage??"")))
                      ),
                    )
                    ,
                  )
                      : InkWell(
                    onTap: ()  async{
                 //     File? image=await y.selectImage(context);
             //         Provider.of<LoginViewModel>(context,listen: false).updateImage(image);
                    },
                    child: Container(
                        width: AppSize.s150,
                        height: AppSize.s150,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child:  Icon(Icons.add,
                            size: AppSize.s50,
                            color: Color(0xFFFFFFFF))),
                  )
                  //:profile1.getLocalPath()!=null?
                  ,
                ),
                InkWell(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.primaryk,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () async
                  {

                    File? image=await y.selectImage(context);

              //      Provider.of<LoginViewModel>(context,listen: false).updateImage(image!);
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }
}

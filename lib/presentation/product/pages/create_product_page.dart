import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/product/bloc/product_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/box_text_field.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateProductPage extends StatelessWidget {
   CreateProductPage({super.key});
  final  TextEditingController nameController = TextEditingController();
  final TextEditingController describtionController = TextEditingController();
   final  TextEditingController priceController = TextEditingController();
   final  TextEditingController qualityController = TextEditingController();
   final _forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarShow("Add Product", context),
      body: Stack(
        children: [
          Center(child: Opacity(
              opacity: 0.1,
              child: Image.asset(ImageAssets.background,fit: BoxFit.contain))),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(ImageAssets.up,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                    context.watch<ProductBloc>().image==null?
                    InkWell(
                      onTap: ()  async{
                        File?   image3=await selectImage(context);
                        BlocProvider.of<ProductBloc>(context).add(AddImageToProductEvent(image3!));
                      },
                      child: Container(
                          width: AppSize.s120,
                          height: AppSize.s120,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            shape: BoxShape.circle,
                          ),
                          child:   Icon(Icons.add,
                              size: AppSize.s50,
                              color:ColorManager.secondaryColor)),
                    ):
                    Center(
                      child: InkWell(
                        onTap: () async {
                          //       BlocProvider.of<SalonBloc>(context).salon.image!=null?
                          //        showDialogFunc(
                          //            context, BlocProvider.of<SalonBloc>(context).salon.image! ):null;
                        },
                        child:
                        Container(
                          width: AppSize.s150,
                          height: AppSize.s150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                              image: DecorationImage(
                                  image:
                                  FileImage(context.read<ProductBloc>().image??File("")))
                          ),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(onPressed: ()async{
                                File?  image3=await selectImage(context);
                                BlocProvider.of<ProductBloc>(context).add(AddImageToProductEvent(image3!));
                              }, icon: Icon(Icons.edit,color: ColorManager.secondaryColor,size: 30))),
                        )
                        ,
                      ),
                    )
                  ],
                ),

                Form(
                  key: _forKey,
                  child: Padding(padding: const EdgeInsets.only(left: 15,top: AppPadding.p20,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Name",style:Theme.of(context).textTheme.titleLarge),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,bottom: 8),
                          child:  TextFieldWidget(
                            hint: "",
                            controller: nameController,

                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field is required";
                              }

                              return null;
                            },
                          ),),
                        Text("Price",style:Theme.of(context).textTheme.titleLarge),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,bottom: 8),
                          child:  TextFieldWidget(
                            hint: "",
                            controller: priceController,

                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field is required";
                              }

                              return null;
                            },
                          ),),
                        Text("Quality",style:Theme.of(context).textTheme.titleLarge),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,bottom: 8),
                          child:  TextFieldWidget(
                            hint: "",
                            controller: qualityController,

                            textInputType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field is required";
                              }

                              return null;
                            },
                          ),),
                        Text("Description",style:Theme.of(context).textTheme.titleLarge),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:BoxTextField(
                            keyboardType:
                            TextInputType.text,
                            prefixIcon: null,
                            maxLines: 10,
                            validator: (value) {
                              return null;
                            },
                            controller:
                            describtionController,
                            obscureText: false,
                            minLines: 5,
                            inputFormatters:const [],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: AppPadding.p20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("status : ",style:Theme.of(context).textTheme.titleLarge,),
                              BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) {
                                  String status1="";
                                  if(state is ChangeStatusState){
                                    status1=state.status;
                                  }
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:
                                    List.generate(2, (index) {
                                      return
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: AppPadding.p8,left: AppPadding.p8),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: Material (
                                              elevation: 5.0,
                                              color: status1 == status[index]
                                                  ? ColorManager.secondaryColor
                                                  : Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  15.0),
                                              child: MaterialButton(
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15),
                                                ),
                                                // splashColor: Colors.transparent,
                                                // highlightColor: Colors.transparent,
                                                onPressed: () {
                                                  BlocProvider.of<ProductBloc>(context).add(ChangeStatusEvent(status[index]));
                                                },
                                                minWidth: 100,
                                                height: 35.0,
                                                child: Text(
                                                  status[index],
                                                  style: TextStyle(
                                                      color:
                                                      status1==status[index]
                                                          ? Colors.white
                                                          : ColorManager.secondaryColor,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),

                        ),
                        BlocListener<ProductBloc, ProductState>(
                          listener: (context, state) {
                            if(state is AddProductLoadingState){
                              loading(context);
                            }
                            if(state is AddProductErrorState){
                              error(context,state.failure.massage,state.failure.code);
                            }
                            if(state is AddProductState){
                              Navigator.of(context).pushNamed(Routes.products);
                            }
                          },
                          child: ElevatedButton(
                            style: const ButtonStyle(),

                            onPressed: () {
                              //     state is LogInLoadingState?
                                _submit(context);
                            },
                            child: const Text("Add"),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        )
                      ],
                    ),

                  ),
                ),

              ],
            ),
          ),
        ],
      ),


    );
  }
   void _submit(BuildContext context){
     if (_forKey.currentState!.validate()) {
       BlocProvider.of<ProductBloc>(context).add(AddProductEvent(
            nameController.text,
            describtionController.text,
        int.parse( priceController.text),
         int.parse( qualityController.text)
       ));


     }
   }
}

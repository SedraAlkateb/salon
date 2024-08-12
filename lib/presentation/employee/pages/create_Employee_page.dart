import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/box_text_field.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateEmployeePage extends StatelessWidget {
   CreateEmployeePage({super.key});
  final  TextEditingController nameController = TextEditingController();
   final  TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarShow("Add Employee", context),
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
                    BlocProvider.of<EmployeeBloc>(context).createEmployeeObject.image==null?
                    InkWell(
                      onTap: ()  async{
                        File?   image3=await selectImage(context);
                        //BlocProvider.of<ServiceBloc>(context).add(ChangeImageSalon(image3!));
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
                  //        BlocProvider.of<SalonBloc>(context).salon.image!=null?
                   //       showDialogFunc(
                    //          context, BlocProvider.of<SalonBloc>(context).salon.image! ):null;
                        },
                        child:
                        Container(
                          width: AppSize.s120,
                          height: AppSize.s120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],

                          ),
                          child: image(BlocProvider.of<ServiceBloc>(context).createServiceObject.image!.path,box: BoxShape.circle),
                        )
                        ,
                      ),
                    )
                  ],
                ),

                Padding(padding: const EdgeInsets.only(left: 15,top: AppPadding.p20,right: 15),
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
                          obscureText:true,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field is required";
                            }

                            return null;
                          },
                        ),),
                      Text("Salary",style:Theme.of(context).textTheme.titleLarge),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 8),
                        child:  TextFieldWidget(
                          hint: "",
                          controller: salaryController,
                          obscureText:true,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field is required";
                            }

                            return null;
                          },
                        ),),
                      BlocListener<ServiceBloc, ServiceState>(
                        listener: (context, state) {
                          // if(state is LogInLoadingState){
                          //   loading(context);
                          // }
                          // if(state is LogInErrorState){
                          //   error(context,state.failure.massage,state.failure.code);
                          // }
                          // if(state is LogInState){
                          //   Navigator.of(context).pushNamed(Routes.homeAdmin);
                          // }
                        },
                        child: ElevatedButton(
                          style: const ButtonStyle(),

                          onPressed: () {
                            //     state is LogInLoadingState?
                            //   _submit(context);
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

              ],
            ),
          ),
        ],
      ),


    );
  }
}

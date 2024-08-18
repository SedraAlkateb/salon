import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateEmployeePage extends StatelessWidget {
   CreateEmployeePage({super.key});
  final  TextEditingController nameController = TextEditingController();
   final  TextEditingController salaryController = TextEditingController();
   final _forKey = GlobalKey<FormState>();

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
                    BlocBuilder<EmployeeBloc, EmployeeState>(
  builder: (context, state) {
    if(state is AddImageToEmployee){
      return
        Center(
          child: InkWell(
            onTap: () async {

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
                      FileImage(state.image))
              ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(onPressed: ()async{
                    File?  image3=await selectImage(context);
                    BlocProvider.of<EmployeeBloc>(context).add(AddImageToEmployeeEvent(image3!));
                  }, icon: Icon(Icons.edit,color: ColorManager.secondaryColor,size: 30))),
            )
            ,
          ),
        );
    }
    return  InkWell(
      onTap: ()  async{
        File?   image3=await selectImage(context);
        BlocProvider.of<EmployeeBloc>(context).add(AddImageToEmployeeEvent(image3!));
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
    );

  },
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
                            obscureText:false,
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
                            obscureText:false,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field is required";
                              }

                              return null;
                            },
                          ),),
                        BlocListener<EmployeeBloc, EmployeeState>(
                          listener: (context, state) {
                            if(state is AddEmployeeLoadingState){
                              loading(context);
                            }
                            if(state is AddEmployeeErrorState){
                              error(context,state.failure.massage,state.failure.code);
                            }
                            if(state is AddEmployeeState){
                              Navigator.of(context).pushNamed(Routes.employees);
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

     if ((BlocProvider.of<EmployeeBloc>(context).createEmployeeObject.image!=null)&&(_forKey.currentState!.validate())) {
       BlocProvider.of<EmployeeBloc>(context).add(AddEmployeeEvent(
           nameController.text,
           int.parse(salaryController.text),
       ));


     }
   }
}

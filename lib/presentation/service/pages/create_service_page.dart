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
import 'package:salon/presentation/uniti/custom_dropdown.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateServicePage extends StatelessWidget {
   CreateServicePage({super.key});
  final  TextEditingController nameController = TextEditingController();
  final TextEditingController describtionController = TextEditingController();
   final  TextEditingController priceController = TextEditingController();
   final  TextEditingController employeeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarShow("Add Service", context),
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
                    BlocProvider.of<ServiceBloc>(context).createServiceObject.image==null?
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
                      Text("Price",style:Theme.of(context).textTheme.titleLarge),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 8),
                        child:  TextFieldWidget(
                          hint: "",
                          controller: priceController,
                          obscureText:true,
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this field is required";
                            }

                            return null;
                          },
                        ),),
                      Text("Employee",style:Theme.of(context).textTheme.titleLarge),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlocConsumer<EmployeeBloc, EmployeeState>(
                            listener: (context, state1) {
                              if(state1 is EmployeesErrorState)
                              {
                                error(context, state1.failure.massage, state1.failure.code);
                              }

                            },
                            builder: (context, state1) {

                              return CustomDropDown(
                                  hintText:"employee",
                                  items: BlocProvider.of<EmployeeBloc>(context).employees,
                                  prefixIcon: null,
                                  onChanged: (value ){
                                    Employees admin=value;
                                  //  BlocProvider.of<HomeAdminBloc>(context).add(ChangeSalonEvent(admin.name,admin.id));
                                    },
                                  validator: (value){
                                  }
                              );
                            },
                          )),
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
                            BlocBuilder<ServiceBloc, ServiceState>(
                              builder: (context, state) {
                                String status1="";
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
                                                //       BlocProvider.of<SalonBloc>(context).add(ChangeStatusEvent(status: status[index]));
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/box_text_field.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateSalon extends StatelessWidget {

  CreateSalon({super.key});
  final  TextEditingController nameController = TextEditingController();
  final TextEditingController describtionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarShow("Add Salon", context),
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
                    BlocProvider.of<SalonBloc>(context).salon.image==null?
                    InkWell(
                      onTap: ()  async{
                        File?   image3=await selectImage(context);
                        BlocProvider.of<SalonBloc>(context).add(ChangeImageSalon(image3!));
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
                          width: AppSize.s120,
                          height: AppSize.s120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],

                          ),
                          child: image(BlocProvider.of<SalonBloc>(context).salon.image!.path,box: BoxShape.circle),
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
                        padding: const EdgeInsets.only(left: 8),
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
                      TextButton(onPressed: (){

                      }, child: Container(
                        color: ColorManager.myGrays,
                        child: Row(children: [
                          Text("Click to add salon position in map",style: Theme.of(context).textTheme.displayLarge,),
                          Icon(Icons.map,color: ColorManager.secondaryColor,)
                        ],),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: AppPadding.p20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("status : ",style:Theme.of(context).textTheme.titleLarge,),
                            BlocBuilder<SalonBloc, SalonState>(
                              builder: (context, state) {
                                String status1="";
                                if(state is ShowSalonState){

                                  status1=state.salonModel.status;
                                  print(status1);
                                }
                                if(state is ChangeStatusSalonState){
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
                      BlocListener<SalonBloc, SalonState>(
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
/*
SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width:  MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                      border: Border.symmetric(vertical:BorderSide(
                          color: ColorManager.secondaryColor,width: 3)
                      ),

                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(AppSize.s30),
                        bottomLeft: Radius.circular(AppSize.s30),

                      ),
                      color: ColorManager.primary,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              child: salon.image != null
                                  ?
                              InkWell(
                                onTap: () async {

                                  showDialogFunc(
                                      context,salon.image!);
                                },
                                child:
                                salon.image!=null?
                                Container(
                                  width: AppSize.s150,
                                  height: AppSize.s150,
                                  decoration: BoxDecoration(

                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],

                                  ),
                                  child: image(salon.image!,box: BoxShape.circle),
                                ):
                                Container(
                                  width: AppSize.s150,
                                  height: AppSize.s150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[100],
                                      image: DecorationImage(
                                          image:
                                          FileImage(File(salon.image!)??File("")))
                                  ),
                                )
                                ,
                              )
                                  : InkWell(
                                onTap: ()  async{
                                  File?   image3=await selectImage(context);
                                },
                                child: Container(
                                    width: AppSize.s150,
                                    height: AppSize.s150,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      border: Border.all( color: ColorManager.secondaryColor,width: 3),
                                      shape: BoxShape.circle,
                                    ),
                                    child:  Icon(Icons.add,
                                        size: AppSize.s50,
                                        color: ColorManager.secondaryColor)
                                ),
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
                                  color: ColorManager.secondaryColor,
                                  border: Border.all(
                                    color: ColorManager.secondaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () async
                              {
                                File? image3=await selectImage(context);
                                //       value.updateImage(image3);
                              },
                            ),
                          ],
                        )
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("      my salon name is ",style: Theme.of(context).textTheme.titleMedium,),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(

                                    enabled: true,
                                    controller:nameController,

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(left: 20,top: AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                ],
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("status : ",style:getMediumStyle(
                    color: ColorManager.primary ,fontSize: FontSize.s20),),
                Row(
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
                            color: salon.status == "active"
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
                                //   Provider.of<StudentViewModel>(context,listen: false).getStudent().student.status=index;
                              },
                              minWidth: 100,
                              height: 35.0,
                              child: Text(
                                salon.status,
                                style: TextStyle(
                                    color:
                                    salon.status=="active"
                                        ? Colors.white
                                        : ColorManager.secondaryColor,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      );
                  }),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s18,),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text("     create    ",style: TextStyle(color: Colors.white),)),
              ),
            ),
            const SizedBox(height: AppSize.s18,),

          ],
        ),
      ),
 */
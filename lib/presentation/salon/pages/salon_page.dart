// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/location/pages/location_page.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/box_text_field.dart';
import 'package:salon/presentation/uniti/custom_dropdown.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class SalonPage extends StatelessWidget {
/*
  GoogleMap(
          onMapCreated: BlocProvider.of<SalonBloc>(context).onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(44.4, 44.4),
              zoom: 15,
            ),
        //  markers: context.watch<SalonBloc>().markers,
        ),
 */
  SalonPage({super.key});
final  TextEditingController nameController = TextEditingController();
 final TextEditingController describtionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const DrawerAdminView(),
      appBar: appBarShow("Salon",context),
      body: BlocConsumer<SalonBloc, SalonState>(
        listener: (context, state) {
          if(state is ShowSalonErrorState){
            error(context, state.failure.massage, state.failure.code);

          }
          if(state is ShowSalonLoadingState){
            loading(context);
          }
          if(state is ShowSalonState){
            success(context);
            describtionController.text=state.salonModel.description;
          }
          if(state is UpdateSalonErrorState){
            error(context, state.failure.massage, state.failure.code);

          }
          if(state is UpdateSalonLoadingState){
            loading(context);
          }
          if(state is UpdateSalonState){
            success(context);
            Navigator.of(context).pushReplacementNamed(Routes.salons);

          }
        },
        builder: (context, state) {
          ShowSalonModel? salonModel ;
          salonModel =BlocProvider.of<SalonBloc>(context).salonModel;
          describtionController.text=salonModel==null?"":salonModel!.description;
          return
              ((state is ShowSalonLoadingState)||(salonModel==null))?
              fullScreenLoadingW(context)
          :

              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        BlocBuilder<SalonBloc, SalonState>(
  builder: (context, state) {
    if(state is ChangeSalonImageState){
      return  Container(
        width: AppSize.s100,
        height: AppSize.s100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
            image: DecorationImage(
                image:
                FileImage(state.image))
        ),
      );
    }
    return Padding(
                            padding: const EdgeInsets.all(AppPadding.p20),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  child: salonModel!.logo_image !=
                                      null
                                      ?
                                  InkWell(
                                    onTap: () async {
                                      showDialogFunc(
                                          context, salonModel!.logo_image !);
                                    },
                                    child:

                                    Container(
                                      width: AppSize.s100,
                                      height: AppSize.s100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[100],

                                      ),
                                      child: image(salonModel.logo_image!,box: BoxShape.circle),
                                    )
                                    ,
                                  )
                                      : InkWell(
                                    onTap: ()  async{
                                      File?   image3=await selectImage(context);
                                      BlocProvider.of<SalonBloc>(context).add(ChangeImageSalon(image3!));
                                    },
                                    child: Container(
                                        width: AppSize.s100,
                                        height: AppSize.s100,
                                        decoration: BoxDecoration(
                                          color: ColorManager.secondaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child:  const Icon(Icons.add,
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
                                    BlocProvider.of<SalonBloc>(context).add(ChangeImageSalon(image3??File("")));
                                  },
                                ),
                              ],
                            )
                        );
  },
),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("      my salon name is ",style: Theme.of(context).textTheme.displayLarge,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      controller: nameController,
                                      enable:state is ChangeNameSalonState?true:false,
                                      hint:state is ShowSalonLoadingState?"Loading": salonModel!.name ,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child:
                                      state is ChangeNameSalonState?
                                      IconButton(onPressed: (){
                                        BlocProvider.of<SalonBloc>(context).add(CheckNameSalonEvent(name: nameController.text));
                                      }, icon:
                                      const Icon(Icons.check,size: 25,)
                                        ,):
                                      IconButton(onPressed: (){
                                        BlocProvider.of<SalonBloc>(context).add(ChangeNameSalonEvent());
                                      }, icon:
                                      const Icon(Icons.edit,size: 25,)

                                        ,)
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20,top: AppPadding.p20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Description",style:Theme.of(context).textTheme.titleLarge),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BoxTextField(
                              enabled: state is ChangeDescriptionSalonState?false:true,
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
                              inputFormatters: const [],
                            ),
                          ),
                          state is ChangeDescriptionSalonState?
                          IconButton(onPressed: (){
                            BlocProvider.of<SalonBloc>(context).add(CheckDescriptionSalonEvent(name: describtionController.text));
                          }, icon:
                          const Icon(Icons.check,size: 25,)
                            ,):
                          IconButton(onPressed: (){
                            BlocProvider.of<SalonBloc>(context).add(ChangeDescriptionSalonEvent());
                          }, icon:
                          const Icon(Icons.edit,size: 25,)

                            ,)
                        ],
                      ),

                    ),

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
                                          BlocProvider.of<SalonBloc>(context).add(ChangeStatusEvent(status: status[index]));
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
                    const SizedBox(height: AppSize.s18,),
                    const Divider(),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.admin_panel_settings_outlined),
                            const SizedBox(width: 8,),
                            Text("Admin ",
                                style: Theme.of(context).textTheme.displayLarge)
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocConsumer<HomeAdminBloc, HomeAdminState>(
                          listener: (context, state1) {
                            if(state1 is AllAdminErrorState)
                            {
                              error(context, state1.failure.massage, state1.failure.code);
                            }
                          },
                          builder: (context, state1) {
                            return CustomDropDown(
                                hintText:state is ViewAdminLoadingState?"Loading":  salonModel!.admin,
                                items: BlocProvider.of<HomeAdminBloc>(context).allAdmin,
                                prefixIcon: null,
                                onChanged: (value){
                                  BlocProvider.of<SalonBloc>(context).add(ChangeAdminEvent(value.name,value.id));
                                },
                                validator: (value){
                                  return null;
                                }
                            );
                          },
                        )),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: ElevatedButton(
                            onPressed: (){
                              BlocProvider.of<SalonBloc>(context).add(UpdateSalonEvent());
                            },
                            child: const Text("     Edit    ",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                    TextButton(onPressed: (){
                      print(double.parse(salonModel!.latitude));
                      print("double.parse(salonModel!.latitude)");
                      Navigator.push(context, MaterialPageRoute(builder: (context){return
                        LocationPage(center: LatLng(double.parse(salonModel!.latitude), double.parse(salonModel.longitude)));
                      },));
                    }, child: Container(
                      color: ColorManager.myGrays,
                      child: Row(children: [
                        Text("Click to the position in map",style: Theme.of(context).textTheme.displayLarge,),
                        Icon(Icons.map,color: ColorManager.secondaryColor,)
                      ],),
                    )),
                    const SizedBox(height: AppSize.s18,),
                    const Divider(thickness: 0.5,),
                    salonModel.employees==null?const SizedBox():
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Employees",
                              style: Theme.of(context).textTheme.displayLarge
                          )),
                    ),
                    salonModel.employees==null?const SizedBox():
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                      itemCount:state is ViewAdminLoadingState? 0:
                      salonModel.employees!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (() {
                          BlocProvider.of<HomeAdminBloc>(context)
                              .add(ViewAdminEvent(salonModel!.employees![index].id));
                          Navigator.pushNamed(context, Routes.viewAdmin);
                        }),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    Text(
                                      "name : ${state is ViewAdminLoadingState?"Loading": salonModel!.employees![index].name}",
                                      style:
                                      Theme.of(context).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<HomeAdminBloc>(context).add(
                                        DeleteAdminEvent(
                                            salonModel!.employees![index].id, index));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: ColorManager.secondaryColor,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    salonModel.employees==null?const SizedBox():
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Products",
                              style: Theme.of(context).textTheme.displayLarge
                          )),
                    ),
                    salonModel.product==null?const SizedBox():
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                      itemCount:state is ViewAdminLoadingState? 0:
                      salonModel.product!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (() {
                          BlocProvider.of<HomeAdminBloc>(context)
                              .add(ViewAdminEvent(salonModel!.product![index].id));
                          Navigator.pushNamed(context, Routes.viewAdmin);
                        }),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    Text(
                                      "name : ${state is ViewAdminLoadingState?"Loading": salonModel!.product![index].name}",
                                      style:
                                      Theme.of(context).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<HomeAdminBloc>(context).add(
                                        DeleteAdminEvent(
                                            salonModel!.product![index].id, index));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: ColorManager.secondaryColor,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
        },
      ),
    );
  }
Widget fullScreenLoadingW(BuildContext context){
  loadingFullScreen(context);
    return Scaffold(
      appBar: AppBar(),
      );
}

}

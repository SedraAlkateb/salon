import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/location/pages/location_page.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
class ShowServiceUserPage extends StatelessWidget {
   const ShowServiceUserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserNavBloc, UserNavState>(
      listener: (context, state) {
        if(state is ShowServiceErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is ShowServiceLoadingState){
          loading(context);
        }
        if(state is ShowServiceState){
          success(context);
        }
      },
      builder: (context, state) {
        ShowService? showServiceUser ;
        showServiceUser =BlocProvider.of<UserNavBloc>(context).serviceModel;
        return Scaffold(
      appBar: appBarShow( showServiceUser==null?"":
          showServiceUser.service.name,context),

      body:    ((state is ShowServiceLoadingState)||(showServiceUser==null))?
      fullScreenLoadingW(context)
          :
      Stack(
        children: [
          Center(child: Opacity(
              opacity: 0.1,
              child: Image.asset(ImageAssets.background,fit: BoxFit.contain))),
          SingleChildScrollView(
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               //   Image.asset(ImageAssets.up,fit:BoxFit.fitWidth,scale: 0.8,),
                  Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.description),
                          const SizedBox(width: 8,),
                          Text("description : ",
                              style: Theme.of(context).textTheme.displayLarge),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                    child: Text(showServiceUser.service.description,style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.price_check),
                          const SizedBox(width: 8,),
                          Text("price : ",
                              style: Theme.of(context).textTheme.displayLarge),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                    child: Text(showServiceUser.service.price.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8,),
                          Text("status : ",
                              style: Theme.of(context).textTheme.displayLarge),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8),
                            child: Text(showServiceUser.service.status,style: Theme.of(context).textTheme.bodyLarge,),
                          ),
                          showServiceUser.service.status=="active"?
                          Icon(Icons.circle,color: Colors.green,): Icon(Icons.circle,color: Colors.black,),

                        ],
                      )),
                  ((showServiceUser.service.date!="")&&(showServiceUser.service.time!=""))?
                  const Divider():SizedBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showServiceUser.service.date!=""?
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 8,),
                                  Text("date : ",
                                      style: Theme.of(context).textTheme.displayLarge),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                            child: Text(showServiceUser.service.date,style: Theme.of(context).textTheme.bodyLarge,),
                          ),
                        ],
                      ):SizedBox(),
                      showServiceUser.service.time!=""?
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 8,top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 8,),
                                  Text("Time : ",
                                      style: Theme.of(context).textTheme.displayLarge),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                            child: Text(showServiceUser.service.time,style: Theme.of(context).textTheme.bodyLarge,),
                          ),
                        ],
                      ):SizedBox()
                    ],
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8,),
                          Text("employee : ",
                              style: Theme.of(context).textTheme.displayLarge),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                    child: Text(showServiceUser.employee,style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_balance_outlined),
                          const SizedBox(width: 8,),
                          Text("salon : ",
                              style: Theme.of(context).textTheme.displayLarge),
                        ],
                      )),
                  showServiceUser.salons==null?const SizedBox():
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                    itemCount:state is ShowServiceLoadingState? 0:
                    showServiceUser.salons!.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                width: 100,

                                child: image(

                                  showServiceUser!.salons![index].logo_image,

                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                                    child:  TextRach(
                                      s1: "name : ",
                                      s2: showServiceUser.salons![index].name,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                                    child:  TextRach(
                                      s1: "description : ",
                                      s2: showServiceUser.salons![index].description,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){return
                            LocationPage(center: LatLng(double.parse(showServiceUser!.salons![index].latitude), double.parse(showServiceUser.salons![index].longitude)));
                          },));
                        }, child: Container(
                          color: ColorManager.myGrays,
                          child: Row(children: [
                            Text("Click to the position in map",style: Theme.of(context).textTheme.displayLarge,),
                            Icon(Icons.map,color: ColorManager.secondaryColor,)
                          ],),
                        )),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  },
);
  }
  Widget fullScreenLoadingW(BuildContext context){
    loadingFullScreen(context);
    return Scaffold(
      appBar: AppBar(),
    );
  }

}
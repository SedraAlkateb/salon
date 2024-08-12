import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
class ShowServicePage extends StatelessWidget {
   const ShowServicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ServiceBloc, ServiceState>(
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
        if(state is UpdateServiceErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is UpdateServiceLoadingState){
          loading(context);
        }
        if(state is UpdateServiceState){
          success(context);
          Navigator.of(context).pushReplacementNamed(Routes.services);

        }
      },
      builder: (context, state) {
        ShowService? showService ;
        showService =BlocProvider.of<ServiceBloc>(context).serviceModel;
        return Scaffold(
      appBar: appBarShow( showService==null?"":
          showService.service.name,context),

      body:    ((state is ShowServiceLoadingState)||(showService==null))?
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
                    child: Text(showService.service.description,style: Theme.of(context).textTheme.bodyLarge,),
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
                    child: Text(showService.service.price.toString(),style: Theme.of(context).textTheme.bodyLarge,),
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
                            child: Text(showService.service.status,style: Theme.of(context).textTheme.bodyLarge,),
                          ),
                          showService.service.status=="active"?
                          Icon(Icons.circle,color: Colors.green,): Icon(Icons.circle,color: Colors.black,),

                        ],
                      )),
                  ((showService.service.date!="")&&(showService.service.time!=""))?
                  const Divider():SizedBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showService.service.date!=""?
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
                            child: Text(showService.service.date,style: Theme.of(context).textTheme.bodyLarge,),
                          ),
                        ],
                      ):SizedBox(),
                      showService.service.time!=""?
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
                            child: Text(showService.service.time,style: Theme.of(context).textTheme.bodyLarge,),
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
                    child: Text(showService.employee,style: Theme.of(context).textTheme.bodyLarge,),
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
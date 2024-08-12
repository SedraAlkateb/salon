import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
class ShowEmployeePage extends StatelessWidget {
   const ShowEmployeePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        if(state is ShowEmployeeErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is ShowEmployeeLoadingState){
          loading(context);
        }
        if(state is ShowEmployeeState){
          success(context);
        }
        if(state is UpdateEmployeeErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is UpdateEmployeeLoadingState){
          loading(context);
        }
        if(state is UpdateEmployeeState){
          success(context);
          Navigator.of(context).pushReplacementNamed(Routes.employees);

        }
      },
      builder: (context, state) {
        ShowEmployee? showEmployee ;
        showEmployee =BlocProvider.of<EmployeeBloc>(context).employeeModel;
        return Scaffold(
      appBar: appBarShow(
          showEmployee==null?"":
          showEmployee.name,context),

      body:    ((state is ShowEmployeeLoadingState)||(showEmployee==null))?
      fullScreenLoadingW(context)
          :
      Stack(
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
                  children: [
                    Image.asset(ImageAssets.up,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          showDialogFunc(
                              context, showEmployee!.image );
                        },
                        child:
                        Container(
                          width: AppSize.s120,
                          height: AppSize.s120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],

                          ),
                          child: image(showEmployee.image,box: BoxShape.circle),
                        )
                        ,
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.price_change),
                        const SizedBox(width: 8,),
                        Text("Salary : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child:Text(
                              "${showEmployee.salary.toString()} sy",style: Theme.of(context).textTheme.bodyLarge,),

                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_balance_outlined),
                        const SizedBox(width: 8,),
                        Text("Salon : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Text(showEmployee.salon.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.admin_panel_settings_outlined),
                        const SizedBox(width: 8,),
                        Text("Admin : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Text(showEmployee.admin!.name,style: Theme.of(context).textTheme.bodyLarge,),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.home_repair_service_sharp),
                        const SizedBox(width: 8,),
                        Text("Service : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Column(
                    children: [
                      TextRach(s1: "Name : ", s2: showEmployee.service!.name),
                      SizedBox(height: 8,),
                      TextRach(s1: "Description : ", s2: showEmployee.service!.description),
                      SizedBox(height: 8,),
                      TextRach(s1: "Price : ", s2: showEmployee.service!. price.toString()),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showEmployee.service!. date==""?SizedBox():
                          TextRach(s1: "Date : ", s2: showEmployee.service!. date.toString()),
                          showEmployee.service!. time==""?SizedBox():
                          TextRach(s1: "Time : ", s2: showEmployee.service!. time.toString()),

                        ],
                      ),
                      TextRach(s1: "Status : ", s2: showEmployee.service!.status),


                    ],
                  ),
                ),
              ],
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
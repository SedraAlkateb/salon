import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/custom_dropdown.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class ViewAdminPage extends StatelessWidget {
  ViewAdminPage({super.key});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //  BlocProvider.of<HomeAdminBloc>(context).add(ViewAdminEvent());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(ImageAssets.login),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.secondaryColor,
            )),
      ),
      body: BlocConsumer<HomeAdminBloc, HomeAdminState>(
        listener: (context, state) {
          if (state is ViewAdminErrorState) {
            error(context, state.failure.massage, state.failure.code);
          }
          if (state is UpdateAdminLoadingState) {
            loading(context);
          }
          if (state is UpdateAdminErrorState) {
            error(context, state.failure.massage, state.failure.code);
          }
          if(state is UpdateAdminState){
            success(context);
            Navigator.of(context).pushReplacementNamed(Routes.homeAdmin);
          }
          if(state is ViewAdminLoadingState){
            loading(context);
          }
          if (state is ViewAdminState) {
           success(context);
           BlocProvider.of<SalonBloc>(context).add(AllSalon());
          }
        },
        builder: (context, state) {
          ViewAdmin?  viewAdmin;
          String salon="loading";
          if (state is ViewAdminState) {
            salon =state.viewAdmin.salon;
         //   viewAdmin=state.viewAdmin;
          }
          if(state is ChangeSalonState){
            salon=state.name;
          }
          viewAdmin=BlocProvider.of<HomeAdminBloc>(context).viewAdmin;
          return viewAdmin==null ?
          const SizedBox():
             SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8,),
                        Text("Name : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: nameController,
                          enable:state is ChangeNameState?true:false,
                            hint:"${state is ViewAdminLoadingState?"Loading": viewAdmin.name }" ,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child:
                            state is ChangeNameState?
                        IconButton(onPressed: (){
                          BlocProvider.of<HomeAdminBloc>(context).add(CheckNameEvent(name: nameController.text));
                        }, icon:
                         const Icon(Icons.check,size: 25,)
                          ,):
                            IconButton(onPressed: (){
                              BlocProvider.of<HomeAdminBloc>(context).add(ChangeNameEvent());
                            }, icon:
                            const Icon(Icons.edit,size: 25,)

                              ,)
                      )
                    ],
                  ),
                  const Divider(),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_balance_outlined),
                          const SizedBox(width: 8,),
                          BlocBuilder<SalonBloc, SalonState>(
  builder: (context, state) {

    return Text("Salon :  $salon",
                              style: Theme.of(context).textTheme.displayLarge);
  },
),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocConsumer<SalonBloc, SalonState>(
  listener: (context, state1) {
   if(state1 is SalonsErrorState)
     {
       error(context, state1.failure.massage, state1.failure.code);
     }

  },
  builder: (context, state1) {

    return CustomDropDown(
                          hintText:state is ViewAdminLoadingState?"Loading":  viewAdmin!.salon,
                          items: BlocProvider.of<SalonBloc>(context).salons,
                          prefixIcon: null,
                          onChanged: (value ){
                            SalonModel admin=value;
                            BlocProvider.of<HomeAdminBloc>(context).add(ChangeSalonEvent(admin.name,admin.id));},
                          validator: (value){
                          }
                      );
  },
)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        BlocProvider.of<HomeAdminBloc>(context).add(UpdateAdminEvent());
                      }, child: const Text("Edit")),
                    ),
                  ),
                  const Divider(thickness: 0.5,),
                  viewAdmin.services==null?const SizedBox():
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Services",
                            style: Theme.of(context).textTheme.displayLarge
                        )),
                  ),
                  viewAdmin.services==null?const SizedBox():
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                    itemCount:state is ViewAdminLoadingState? 0:
                    viewAdmin.services!.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (() {
                        BlocProvider.of<HomeAdminBloc>(context)
                            .add(ViewAdminEvent(viewAdmin!.services![index].id));
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
                                    "name : ${state is ViewAdminLoadingState?"Loading": viewAdmin?.services![index].name}",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: 0.5,),
                  viewAdmin.products==null?const SizedBox():
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Products",
                            style: Theme.of(context).textTheme.displayLarge
                        )),
                  ),
                  viewAdmin.products==null?const SizedBox():
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                    itemCount:state is ViewAdminLoadingState? 0:
                    viewAdmin.products!.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (() {
                        BlocProvider.of<HomeAdminBloc>(context)
                            .add(ViewAdminEvent(viewAdmin!.products![index].id));
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
                                    "name : ${state is ViewAdminLoadingState?"Loading": viewAdmin?.products![index].name}",
                                    style:
                                    Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
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
}

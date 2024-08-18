import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/search_field.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
class HomeAdminPage extends StatefulWidget {
 const  HomeAdminPage({super.key});
  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  void initState() {
    BlocProvider.of<HomeAdminBloc>(context).add(AllAdminEvent());
    super.initState();
  }
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const DrawerAdminView(),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
leading: Builder(
  builder: (BuildContext context) {
    return IconButton(
      icon: Icon(
        size: AppSize.s30,
        Icons.menu,
        color: ColorManager.secondaryColor, // هنا يمكنك تحديد لون الأيقونة
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  },
),
        actions: [
          Image.asset(ImageAssets.login),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                    bottom: AppPadding.p28,
                    top: AppPadding.p28
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("All Admin",style: Theme.of(context).textTheme.labelMedium,),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SearchField(
                            searchController:_searchController,
                            onPressed: (){
                              BlocProvider.of<HomeAdminBloc>(context).add(FindAdmin(_searchController.text));
                            },
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              BlocProvider.of<HomeAdminBloc>(context).add(AllAdminEvent());
                            },
                            child: Text("All",)),
                      ],
                    ),
                    BlocConsumer<HomeAdminBloc, HomeAdminState>(
              listener: (context, state) {
                if(state is DeleteAdminErrorState){
                  error(context, state.failure.massage, state.failure.code);
                }
                if(state is DeleteAdminLoadingState){
                  loading(context);
                }
            if(state is AllAdminLoadingState){
              loading(context);
            }
            if(state is AllAdminErrorState){
              error(context,state.failure.massage,state.failure.code);
            }
                if(state is AllAdminState) {
                  success(context);
                }
                if(state is DeleteAdminState){
                  success(context);
                }
                if(state is FindAdminLoadingState){
                  loading(context);
                }
                if(state is FindAdminErrorState){
                  error(context,state.failure.massage,state.failure.code);
                }
                if(state is FindAdminState) {
                  success(context);
                }
                
              },
              builder: (context, state) {
                 List<Admin> allAdmin=BlocProvider.of<HomeAdminBloc>(context).allAdmin;
                 return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>
                    const SizedBox(
            width: double.infinity,
            height: AppSize.s20,
            // color: Color,
                    ),
                    itemCount:
                    allAdmin
              .length,
                    itemBuilder: (context, index) =>
              Container(
                //    height: AppSize.s150,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  border: Border.all(color: ColorManager.hintGrey),
                  borderRadius: const BorderRadius.all(

                      Radius.circular(AppSize.s30)),
                  //        color: ColorManager.card,
                ),
                child: InkWell(
                  onTap: (() {
                    BlocProvider.of<HomeAdminBloc>(context).add(ViewAdminEvent(allAdmin[index].id));
                    Navigator.pushNamed(context,Routes.viewAdmin );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p8),
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
                              Text("name : ${allAdmin[index].name}",style:Theme.of(context).textTheme.labelSmall ,),
                            ],
                          ),
                        ),
                        IconButton(onPressed: () {
                          BlocProvider.of<HomeAdminBloc>(context).add(DeleteAdminEvent(allAdmin[index].id,index));
                        },
                            icon: Icon(
                              Icons.delete, color: ColorManager.secondaryColor,
                              size: 20,))
                      ],
                    ),
                  ),
                ),
              ),
                  );

              },
            ),
                  ],
                )
            ),
          ),

          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p28),
                child: IconButton(
                  onPressed: (){
                    BlocProvider.of<SalonBloc>(context).add(AllSalon());
                    Navigator.pushNamed(context, Routes.createAdmin);
                  }, icon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x0b000000),
                              blurRadius: 5,
                              spreadRadius: 0.3,
                              offset: Offset(0, 0)
                          )
                        ]
                    ),
                    child: const Icon(Icons.add_circle)),color: ColorManager.secondaryColor,iconSize: 65,),
              )),

        ],
      ),
    );
  }
}

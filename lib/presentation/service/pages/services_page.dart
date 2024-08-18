
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/app/di.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin_1.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/service/widgets/services_widget.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  void initState() {
    initServicesModule();
    BlocProvider.of<ServiceBloc>(context).add(AllService());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Constants.type==1?DrawerAdmin1View(): DrawerAdminView(),
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                size: AppSize.s30,
                Icons.menu,
                color:
                ColorManager.secondaryColor, // هنا يمكنك تحديد لون الأيقونة
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
          Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                  bottom: AppPadding.p28,
                  top: AppPadding.p28),
              child: BlocConsumer<ServiceBloc, ServiceState>(
                listener: (context, state) {
                  if (state is ServicesErrorState) {
                    error(context, state.failure.massage, state.failure.code);
                  }
                  if (state is ServicesLoadingState) {
                    loading(context);
                  }
                  if (state is ServicesState) {
                    success(context);
                  }
                },
                builder: (context, state) {
                  List<Service> services =
                      BlocProvider.of<ServiceBloc>(context).services;
                  return SingleChildScrollView(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: AppPadding.p20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: AppPadding.p8,
                                left: AppPadding.p8,
                                bottom: AppPadding.p20),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: AppPadding.p8,
                                      left: AppPadding.p8),
                                  child: Icon(Icons.account_balance_sharp),
                                ),
                                Text(
                                  "All Service",
                                  style:
                                  Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: double.infinity,
                              height: AppSize.s20,
                              // color: Color,
                            ),
                            itemCount: services.length,
                            itemBuilder: (context, index) =>
                                ServicesWidget(service: services[index], index: index),
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
          Constants.type==1?
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p28),
                child: IconButton(
                  onPressed: () {
                    initEmployeesModule();
                    Navigator.pushNamed(context, Routes.createService);
                    BlocProvider.of<EmployeeBloc>(context).add(AllEmployee());
                  },
                  icon: Container(
                      decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            color: Color(0xB000000),
                            blurRadius: 5,
                            spreadRadius: 0.3,
                            offset: Offset(0, 0))
                      ]),
                      child: const Icon(Icons.add_circle)),
                  color: ColorManager.secondaryColor,
                  iconSize: 65,
                ),
              )):SizedBox(),
        ],
      ),
    );
  }
}

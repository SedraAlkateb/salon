
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin_1.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/employee/widgets/employees_widget.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/search_field.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';

class EmployeesPage extends StatefulWidget {

  const EmployeesPage({super.key});
  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  void initState() {
    BlocProvider.of<EmployeeBloc>(context).add(AllEmployee());
    super.initState();
  }
  final TextEditingController _searchController = TextEditingController();

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
              child: BlocConsumer<EmployeeBloc, EmployeeState>(
                listener: (context, state) {
                  if (state is EmployeesErrorState) {
                    error(context, state.failure.massage, state.failure.code);
                  }
                  if (state is EmployeesLoadingState) {
                    loading(context);
                  }
                  if (state is EmployeesState) {
                    success(context);
                  }
                  if (state is FindEmployeeErrorState) {
                    error(context, state.failure.massage, state.failure.code);
                  }
                  if (state is FindEmployeeLoadingState) {
                    loading(context);
                  }
                  if (state is FindEmployeeState) {
                    success(context);
                  }
                },
                builder: (context, state) {
                  List<Employees> employees =
                      BlocProvider.of<EmployeeBloc>(context).employees;
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
                                  "All Employee",
                                  style:
                                  Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SearchField(
                                  searchController:_searchController,
                                  onPressed: (){
                                    BlocProvider.of<EmployeeBloc>(context).add(FindEmployee(_searchController.text));
                                  },
                                ),
                              ),
                              InkWell(
                                  onTap: (){
                                    BlocProvider.of<EmployeeBloc>(context).add(AllEmployee());
                                  },
                                  child: Text("All",)),
                            ],
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: double.infinity,
                              height: AppSize.s20,
                              // color: Color,
                            ),
                            itemCount: employees.length,
                            itemBuilder: (context, index) =>
                                EmployeesWidget(employee: employees[index], index: index),
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
                    Navigator.pushNamed(context, Routes.createEmployee);
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

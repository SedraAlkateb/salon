import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text.dart';
class EmployeesWidget extends StatelessWidget {
  const EmployeesWidget({super.key,required this.employee,required this.index});
  final Employees employee;
  final index;
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(AppPadding.p5),
      //    height: AppSize.s150,
      decoration: BoxDecoration(
        color: ColorManager.white,
        border:
        Border.all(color: ColorManager.hintGrey),
        borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s30)),
        //        color: ColorManager.card,
      ),
      child: InkWell(
        onTap: (() {
          BlocProvider.of<EmployeeBloc>(context).add
            (ShowEmployeeEvent(employee.id));
          Navigator.pushNamed(context, Routes.employee);
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p12),
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p2),
                child: image(employee.image),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextRach(
                            s1: "name : ",
                            s2: employee.name,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.price_change_outlined),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextRach(
                            s1: "salary : ",
                            s2: employee.salary.toString(),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Constants.type==1?
              IconButton(onPressed: () {
                BlocProvider.of<EmployeeBloc>(context).add(DeleteEmployeeEvent(employee.id,index));
              },
                  icon: Icon(
                    Icons.delete, color: ColorManager.secondaryColor,
                    size: 20,)):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

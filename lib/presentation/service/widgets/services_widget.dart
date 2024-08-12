import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/uniti/text.dart';
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key,required this.service,required this.index});
  final Service service;
  final index;
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(AppPadding.p8),
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
          BlocProvider.of<ServiceBloc>(context).add
            (ShowServiceEvent(service.id));
          Navigator.pushNamed(context, Routes.service);
        }),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p16),
                child:  Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.home_repair_service_sharp),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextRach(
                            s1: "name : ",
                            s2: service.name,
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
                        Icon(Icons.description),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextRach(
                            s1: "describtion : ",
                            s2: service.description,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            Constants.type==1?
            IconButton(onPressed: () {
              BlocProvider.of<ServiceBloc>(context).add(DeleteServiceEvent(service.id,index));
            },
                icon: Icon(
                  Icons.delete, color: ColorManager.secondaryColor,
                  size: 20,)):SizedBox()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
class ServiceWid extends StatelessWidget {
  const ServiceWid({super.key,required this.service,required this.index});
  final Service service;
  final index;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          border:
          Border.all(color: ColorManager.grey),
          borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8)),
          //        color: ColorManager.card,
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  TextRach(
                    s1: "name service: ",
                    s2: service.name,
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  TextRach(
                    s1: "describtion : ",
                    s2: service.description,
                  ),
                  TextRach(
                    s1: "price : ",
                    s2: "${service.price.toString()} \$",
                  ),
                  service.time==""||service.date==""?SizedBox():
                  Row(
                    children: [
                      Expanded(
                        child: TextRach(
                          s1: "time : ",
                          s2: service.time,
                        ),
                      ),
                      Expanded(
                        child: TextRach(
                          s1: "date : ",
                          s2: service.date,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<UserNavBloc>(context).add
                        (ShowServiceEvent(service.id));
                      Navigator.pushNamed(context, Routes.serviceUser);
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      color: ColorManager.myGrays,
                      child: TextRach(
                        s1: "see more ...",
                        s2: "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets
                        .all(
                        6), // Adjust padding to control the size of the circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.secondaryColor
                          .withOpacity(
                          0.3), // Transparent gray color
                    ),
                    child: Icon(
                      Icons
                          .app_registration,
                      size: 30,
                      color: ColorManager
                          .white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Click to book a service",style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

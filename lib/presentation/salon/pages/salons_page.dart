import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/drawer/pages/drawer_admin.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';

class Salonspage extends StatefulWidget {
  const Salonspage({super.key});

  @override
  State<Salonspage> createState() => _SalonspageState();
}

class _SalonspageState extends State<Salonspage> {
  @override
  void initState() {
    BlocProvider.of<SalonBloc>(context).add(AllSalon());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAdminView(),
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
              child: BlocConsumer<SalonBloc, SalonState>(
                listener: (context, state) {
                  if (state is SalonsErrorState) {
                    error(context, state.failure.massage, state.failure.code);
                  }
                  if (state is SalonsLoadingState) {
                    loading(context);
                  }
                  if (state is SalonsState) {
                    success(context);
                  }
                },
                builder: (context, state) {
                  List<SalonModel> salons =
                      BlocProvider.of<SalonBloc>(context).salons;
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
                                  "All Salon",
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
                            itemCount: salons.length,
                            itemBuilder: (context, index) =>
                                Container(
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
                                  BlocProvider.of<SalonBloc>(context).add
                                    (ShowSalonEvent(salons[index].id,
                                      lat: double.parse(salons[index].latitude),
                                      lng:double.parse(salons[index].longitude) ));
                                  Navigator.pushNamed(context, Routes.salon);
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: AppPadding.p12),
                                        child: image(salons[index].logo_image),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: AppPadding.p2,
                                                bottom: AppPadding.p2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TextRach(
                                                  s1: "name : ",
                                                  s2: salons[index].name,
                                                ),
                                                const SizedBox(
                                                  height: AppSize.s8,
                                                ),
                                                TextRach(
                                                  s1: "describtion : ",
                                                  s2: salons[index].description,
                                                ),
                                              ],
                                            )),
                                      ),
                                      BlocConsumer<SalonBloc, SalonState>(
                                        listener: (context, state) {
                                          if(state is DeleteSalonErrorState){
                                            error(context, state.failure.massage,
                                                state.failure.code);
                                          }
                                          if(state is DeleteSalonLoadingState){
                                            loading(context);
                                          }
                                          if(state is DeleteSalonState){
                                            success(context);
                                          }
                                        },
                                        builder: (context, state) {
                                          return IconButton(
                                              onPressed: () {
                                                BlocProvider.of<SalonBloc>(
                                                        context)
                                                    .add(DeleteSalonEvent(
                                                        salons[index].id,
                                                        index));
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color:
                                                    ColorManager.secondaryColor,
                                                size: 20,
                                              ));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p28),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.createSalon);
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
              )),
        ],
      ),
    );
  }
}

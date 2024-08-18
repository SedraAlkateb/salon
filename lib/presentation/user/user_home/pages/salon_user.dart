
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/location/pages/location_page.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/search_field.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';

class SalonUser extends StatelessWidget {
   SalonUser({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p20,
              right: AppPadding.p20,
              bottom: AppPadding.p28,
              ),
          child: BlocConsumer<UserNavBloc, UserNavState>(
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
                  BlocProvider.of<UserNavBloc>(context).salons;
              return SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: AppPadding.p20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: SearchField(
                                searchController:_searchController,
                                onPressed: (){
                                  BlocProvider.of<UserNavBloc>(context).add(UserFindSalon(_searchController.text));
                                },
                              ),
                            ),
                            InkWell(
                                onTap: (){
                                  BlocProvider.of<UserNavBloc>(context).add(AllSalon());
                                },
                                child: Text("All",)),
                          ],
                        ),
                      ),
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
                                onTap: (()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){return
                                    LocationPage(center: LatLng(double.parse(salons[index].latitude), double.parse(salons[index].longitude)));
                                  },));
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
    );
  }
}

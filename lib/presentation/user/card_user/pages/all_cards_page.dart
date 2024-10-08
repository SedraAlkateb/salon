import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/user/card_user/bloc/card_bloc.dart';
import 'package:salon/domain/models/models.dart' as model;
class AllCardsPage extends StatelessWidget {
  const AllCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarShow("Show Cards", context),
body: BlocConsumer<CardBloc, CardState>(
  listener: (context, state) {
    if(state is CardsErrorState){
      error(context, state.failure.massage, state.failure.code);
    }
  },
  builder:(context, state){
    if(state is CardsState){
      List<model.Card> cards=[];
      return  ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) =>
        const SizedBox(
          width: double.infinity,
          height: AppSize.s20,
          // color: Color,
        ),
        itemCount: cards.length,
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

                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
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
                                  s1: "Card Salon : ",
                                  s2: cards[index].salonCard!.name,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      );
    }
    return SizedBox();
  }
),
    );
  }
}

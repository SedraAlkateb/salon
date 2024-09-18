import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/product/bloc/product_bloc.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text.dart';


class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key,required this.product,required this.index});
  final Product product;
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
          BlocProvider.of<ProductBloc>(context).add
            (ShowProductEvent(product.id));
          Navigator.pushNamed(context, Routes.product);
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
                    horizontal: AppPadding.p8),
                child: image(product.image),
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
                        Icon(Icons.home_repair_service_sharp),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextRach(
                            s1: "name : ",
                            s2: product.name,
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
                            s2: product.description,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Constants.type==1?
              IconButton(onPressed: () {
                BlocProvider.of<ProductBloc>(context).add(DeleteProductEvent(product.id,index));
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

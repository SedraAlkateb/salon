import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/search_field.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
import 'package:salon/presentation/user/user_home/widgets/product_wid.dart';

class ProductUser extends StatelessWidget {
  ProductUser({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body: BlocConsumer<UserNavBloc, UserNavState>(
        listener: (context, state) {
          if (state is ProductsErrorState) {
            error(context, state.failure.massage, state.failure.code);
          }
          if (state is ProductsLoadingState) {
            loading(context);
          }
          if (state is ProductsState) {
            success(context);
          }
        },
        builder: (context, state) {
          List<Product> products =
              BlocProvider
                  .of<UserNavBloc>(context)
                  .products;
          return SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SearchField(searchController: _searchController),

                BlocListener<UserNavBloc, UserNavState>(
                  listener: (context, state) {
                    if(state is AddItemLoadingState){
                      loading(context);
                    }
                    if(state is AddItemErrorState){
                      error(context, state.failure.massage, state.failure.code);
                    }
                    if(state is AddItemState){
                      successWithMessage(context,state.message??"Success");
                    }
                  },
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      width: double.infinity,
                      height: AppSize.s20,
                      // color: Color,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) =>
                        ProductWid(product: products[index], index: index),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

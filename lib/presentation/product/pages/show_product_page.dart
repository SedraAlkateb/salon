import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/product/bloc/product_bloc.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
class ShowProductPage extends StatelessWidget {
   const ShowProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if(state is ShowProductErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is ShowProductLoadingState){
          loading(context);
        }
        if(state is ShowProductState){
          success(context);
        }
        if(state is UpdateProductErrorState){
          error(context, state.failure.massage, state.failure.code);

        }
        if(state is UpdateProductLoadingState){
          loading(context);
        }
        if(state is UpdateProductState){
          success(context);
          Navigator.of(context).pushReplacementNamed(Routes.products);

        }
      },
      builder: (context, state) {
        ShowProduct? showProduct ;
        showProduct =BlocProvider.of<ProductBloc>(context).productModel;
        return Scaffold(
      appBar: appBarShow(
          showProduct==null?"":
          showProduct.name,context),

      body:    ((state is ShowProductLoadingState)||(showProduct==null))?
      fullScreenLoadingW(context)
          :
      Stack(
        children: [
          Center(child: Opacity(
              opacity: 0.1,
              child: Image.asset(ImageAssets.background,fit: BoxFit.contain))),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: imageProduct(showProduct.image),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.description),
                        const SizedBox(width: 8,),
                        Text("description : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Text(showProduct.description,style: Theme.of(context).textTheme.bodyLarge,),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.price_check),
                        const SizedBox(width: 8,),
                        Text("price : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Text(showProduct.price.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.data_saver_off),
                        const SizedBox(width: 8,),
                        Text("quantity : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 8,bottom: 8),
                  child: Text(showProduct. quantity.toString(),style: Theme.of(context).textTheme.bodyLarge,),
                ),
                showProduct.admins==null?const SizedBox():
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.admin_panel_settings_outlined),
                        const SizedBox(width: 8,),
                        Text("Admins : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                showProduct.admins==null?const SizedBox():
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                  itemCount:state is ShowProductLoadingState? 0:
                  showProduct.admins!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (() {
              //        BlocProvider.of<View>(context)
               //           .add(ViewAdminEvent(salonModel!.employees![index].id));
               //       Navigator.pushNamed(context, Routes.viewAdmin);
                    }),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: AppPadding.p8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            child: Row(
                              children: [
                                Text(
                                  "name : ${state is ShowProductLoadingState?"Loading": showProduct!.admins![index].name}",
                                  style:
                                  Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(left: 8,top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_balance_outlined),
                        const SizedBox(width: 8,),
                        Text("Salons : ",
                            style: Theme.of(context).textTheme.displayLarge),
                      ],
                    )),
                showProduct.salons==null?const SizedBox():
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>   const Divider(thickness: 0.5,),
                  itemCount:state is ShowProductLoadingState? 0:
                  showProduct.salons!.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (() {
                      //        BlocProvider.of<View>(context)
                      //           .add(ViewAdminEvent(salonModel!.employees![index].id));
                      //       Navigator.pushNamed(context, Routes.viewAdmin);
                    }),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: AppPadding.p8,horizontal: AppPadding.p8),
                      child:  TextRach(
                        s1: "name : ",
                        s2: showProduct!.salons![index].name,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  },
);
  }
  Widget fullScreenLoadingW(BuildContext context){
    loadingFullScreen(context);
    return Scaffold(
      appBar: AppBar(),
    );
  }

}
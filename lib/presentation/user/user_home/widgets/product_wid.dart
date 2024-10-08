import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/dialog_wid.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/uniti/text_field.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
class ProductWid extends StatelessWidget {
   ProductWid({super.key,required this.product,required this.index});
  final Product product;
  final index;
  final TextEditingController _quantityController = TextEditingController();

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
                    s1: "name product: ",
                    s2: product.name,
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  TextRach(
                    s1: "describtion : ",
                    s2: product.description,
                  ),
                  TextRach(
                    s1: "price : ",
                    s2: "${product.price.toString()} \$",
                  ),
                  TextRach(
                    s1: "quantity : ",
                    s2: product.quantity.toString(),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: imageProduct(product.image)),
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => DialogFilter(
                    text: "Add To Card",
                    widget: Column(
                      children: [
                        TextFieldWidget(
                            hint: "quantity",
                          controller: _quantityController,
                          textInputType: TextInputType.number ,
                        ),
                        SizedBox(height: 25,),
                        ElevatedButton(onPressed: (){
                          if (_quantityController.text!="") {
                            BlocProvider.of<UserNavBloc>(context).add(AddItemEvent
                              (
                                product.id,
                                int.parse(_quantityController.text)
                            ));
                            Navigator.pop(context);
                          }
                        }, child: Text("Ok"))
                      ],
                    ),
                  ),
                );
              },
              child: Padding(
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
                            .shopping_cart_checkout,
                        size: 30,
                        color: ColorManager
                            .white,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Click to add To Card",style: Theme.of(context).textTheme.titleLarge,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

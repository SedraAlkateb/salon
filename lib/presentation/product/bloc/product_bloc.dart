import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/add_product_usecase.dart';
import 'package:salon/domain/usecase/all_product_usecase.dart';
import 'package:salon/domain/usecase/delete_product_usecase.dart';
import 'package:salon/domain/usecase/find_product_usecase.dart';
import 'package:salon/domain/usecase/view_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ShowProduct? productModel;
  List<Product> products=[];
  AllProductUsecase productsUsecase;
  DeleteProductUsecase deleteProductUsecase;
  ViewProductUsecase viewProductUsecase;
  AddProductUsecase addProductUsecase;
  FindProductUsecase findProductUsecase;
  File? image;
  String status="";
  ProductBloc(
      this.productsUsecase,
      this.viewProductUsecase,
      this.deleteProductUsecase,
      this.addProductUsecase,
      this.findProductUsecase
      ) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async{
      if(event is AllProduct){
        products=[];
        emit(ProductsLoadingState());
        ( await productsUsecase. execute()).fold(

                (failure)  {
              emit(ProductsErrorState(failure: failure));
            },
                (data)  async{
              products=data;

              emit(ProductsState(data));
            }
        );
      }
      if(event is FindProduct)
      {products=[];
        emit(FindProductLoadingState());
        ( await findProductUsecase. execute(event.find)).fold(
                (failure)  {
              emit(FindProductErrorState(failure: failure));
            },
                (data)  async{
              products=data;

              emit(FindProductState(data));
            }
        );
      }
      if(event is DeleteProductEvent){
        emit(DeleteProductLoadingState());
        ( await deleteProductUsecase. execute(event.id)).fold(
                (failure)  {
              emit(DeleteProductErrorState(failure: failure));
            },
                (data)  async{
                  products.removeAt(event.index);
              emit(DeleteProductState());
            }

        );
      }
      if(event is ShowProductEvent){
        emit(ShowProductLoadingState());

        ( await viewProductUsecase. execute(event.id)).fold(
                (failure)  {
              emit(ShowProductErrorState(failure: failure));
            },
                (data)  async{
                  productModel=data;
              emit(ShowProductState(data));
            }

        );
      }
      if(event is AddProductEvent){
        emit(AddProductLoadingState());
        ( await addProductUsecase. execute(
            AddProductReq(event.name, event.desc,event.price,event.qu, image??File(""))
        )).fold(
                (failure)  {
              emit(AddProductErrorState(failure: failure));
            },
                (data)  async{
              emit(AddProductState());
            }
        );
      }
      if(event is AddImageToProductEvent){
        print("object");
        print(event.image);
        image=event.image;
        emit(AddImageToProduct(event.image));
      }
      if(event is ChangeStatusEvent){
        status=event.status;
        emit(ChangeStatusState(event.status));
      }
    });
  }
}




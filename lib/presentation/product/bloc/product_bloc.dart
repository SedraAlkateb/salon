import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_product_usecase.dart';
import 'package:salon/domain/usecase/delete_product_usecase.dart';
import 'package:salon/domain/usecase/view_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ShowProduct? productModel;
  List<Product> products=[];
  AllProductUsecase productsUsecase;
  DeleteProductUsecase deleteProductUsecase;
  ViewProductUsecase viewProductUsecase;
  ProductBloc(
      this.productsUsecase,
      this.viewProductUsecase,
      this.deleteProductUsecase
      ) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async{
      if(event is AllProduct){
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
    });
  }
}




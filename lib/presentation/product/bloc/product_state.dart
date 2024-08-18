
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props =>[];
}
final class ProductsState extends ProductState {
  final List<Product> Products;
  ProductsState(this.Products);
  @override
  List<Object?> get props =>[Products];
}
final class ProductsErrorState extends ProductState {
  final Failure failure;
  ProductsErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class ProductsLoadingState extends ProductState {
  @override
  ProductsLoadingState();
  @override
  List<Object?> get props =>[];
}

final class FindProductState extends ProductState {
  final List<Product> FindProduct;
  FindProductState(this.FindProduct);
  @override
  List<Object?> get props =>[FindProduct];
}
final class FindProductErrorState extends ProductState {
  final Failure failure;
  FindProductErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class FindProductLoadingState extends ProductState {
  @override
  FindProductLoadingState();
  @override
  List<Object?> get props =>[];
}

final class DeleteProductState extends ProductState {

  DeleteProductState();
  @override
  List<Object?> get props =>[];
}
final class DeleteProductErrorState extends ProductState {
  final Failure failure;
  DeleteProductErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class DeleteProductLoadingState extends ProductState {
  DeleteProductLoadingState();
  @override
  List<Object?> get props =>[];
}

final class ShowProductState extends ProductState {
  final ShowProduct ProductModel;

  ShowProductState(this.ProductModel);
  @override
  List<Object?> get props =>[ProductModel];
}
final class ShowProductErrorState extends ProductState {
  final Failure failure;
  ShowProductErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class ShowProductLoadingState extends ProductState {
  ShowProductLoadingState();
  @override
  List<Object?> get props =>[];
}
final class UpdateProductState extends ProductState {
  UpdateProductState();
  @override
  List<Object?> get props =>[];
}
final class UpdateProductErrorState extends ProductState {
  final Failure failure;
  UpdateProductErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class UpdateProductLoadingState extends ProductState {
  UpdateProductLoadingState();
  @override
  List<Object?> get props =>[];
}
final class AddProductState extends ProductState {

  AddProductState();
  @override
  List<Object?> get props =>[];
}
final class AddProductErrorState extends ProductState {
  final Failure failure;
  AddProductErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class AddProductLoadingState extends ProductState {
  AddProductLoadingState();
  @override
  List<Object?> get props =>[];
}
final class AddImageToProduct extends ProductState {
  File image;
  AddImageToProduct(this.image);
  @override
  List<Object?> get props =>[image];
}
class ChangeStatusState extends ProductState {
  final String status;
  ChangeStatusState(this.status);

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

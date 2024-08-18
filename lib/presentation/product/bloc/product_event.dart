
part of 'product_bloc.dart';


abstract class ProductEvent extends Equatable{}

class AllProduct extends ProductEvent {
  AllProduct();
  @override
  List<Object?> get props =>[];
}
class DeleteProductEvent extends ProductEvent {
  final int id;
  final int index;
  DeleteProductEvent(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class ShowProductEvent extends ProductEvent {
  final  int id;
  ShowProductEvent(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
final class AddImageToProductEvent extends ProductEvent {
  File image;
  AddImageToProductEvent(this.image);
  @override
  List<Object?> get props =>[image];
}

class AddProductEvent extends ProductEvent {
  final String name;
  final String desc;
  final int price;
  final int qu;
  AddProductEvent(this.name, this.desc, this.price, this.qu);

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class ChangeStatusEvent extends ProductEvent {
  final String status;
  ChangeStatusEvent(this.status);

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class FindProduct extends ProductEvent {
  String find;
  FindProduct(this.find);
  @override
  // TODO: implement props
  List<Object?> get props =>[find];
}


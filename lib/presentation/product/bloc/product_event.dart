
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


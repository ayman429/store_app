part of 'get_products_cubit.dart';

sealed class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final List<Product> products;

  const GetProductsSuccess(this.products);
}

final class GetProductsFailure extends GetProductsState {
  final String errMessage;

  const GetProductsFailure(this.errMessage);
}

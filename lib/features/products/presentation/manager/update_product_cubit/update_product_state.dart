part of 'update_product_cubit.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}

final class UpdateProductLoading extends UpdateProductState {}

final class UpdateProductSuccess extends UpdateProductState {
  final Product product;

  const UpdateProductSuccess(this.product);
}

final class UpdateProductFailure extends UpdateProductState {
  final String errMessage;

  const UpdateProductFailure(this.errMessage);
}

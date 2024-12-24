// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repos/products_repo.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit(
    this.productsRepo,
  ) : super(UpdateProductInitial());

  final ProductsRepo productsRepo;

  Future<void> updateProduct({required Product product}) async {
    emit(UpdateProductLoading());
    final product1 = await productsRepo.updateProduct(product: product);
    product1.fold(
      (failure) => emit(UpdateProductFailure(failure.errMessage)),
      (product) => emit(UpdateProductSuccess(product)),
    );
  }
}

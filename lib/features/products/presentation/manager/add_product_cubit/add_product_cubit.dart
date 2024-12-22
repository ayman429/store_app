// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repos/products_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(
    this.productsRepo,
  ) : super(AddProductInitial());

  final ProductsRepo productsRepo;

  Future<void> addProduct({required Product product}) async {
    emit(AddProductLoading());
    final product1 = await productsRepo.addProduct(product: product);
    product1.fold(
      (failure) => emit(AddProductFailure(failure.errMessage)),
      (product) => emit(AddProductSuccess(product)),
    );
  }
}

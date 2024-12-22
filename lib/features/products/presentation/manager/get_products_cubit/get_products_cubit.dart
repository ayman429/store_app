// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repos/products_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(
    this.productsRepo,
  ) : super(GetProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final products = await productsRepo.getAllProducts();
    products.fold(
      (failure) => emit(GetProductsFailure(failure.errMessage)),
      (product) => emit(GetProductsSuccess(product)),
    );
  }
}

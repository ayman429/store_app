// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product/product.dart';
import '../../../data/repos/products_repo.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(
    this.productsRepo,
  ) : super(GetCategoriesInitial());

  final ProductsRepo productsRepo;

  Future<void> getCategories({required String categoryName}) async {
    emit(GetCategoriesLoading());
    final products =
        await productsRepo.getCategories(categoryName: categoryName);
    products.fold(
      (failure) => emit(GetCategoriesFailure(failure.errMessage)),
      (product) => emit(GetCategoriesSuccess(product)),
    );
  }
}

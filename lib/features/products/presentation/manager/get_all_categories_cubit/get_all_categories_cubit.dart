// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/products_repo.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(
    this.productsRepo,
  ) : super(GetAllCategoriesInitial());

  final ProductsRepo productsRepo;

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());
    final products = await productsRepo.getAllCategories();
    products.fold(
      (failure) => emit(GetAllCategoriesFailure(failure.errMessage)),
      (product) => emit(GetAllCategoriesSuccess(product)),
    );
  }
}

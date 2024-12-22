part of 'get_all_categories_cubit.dart';

sealed class GetAllCategoriesState extends Equatable {
  const GetAllCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<dynamic> allCategories;

  const GetAllCategoriesSuccess(this.allCategories);
}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errMessage;

  const GetAllCategoriesFailure(this.errMessage);
}

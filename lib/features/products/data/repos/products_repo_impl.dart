import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_app/core/errors/failures.dart';

import '../../../../util/api_service.dart';
import '../models/product/product.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final response = await apiService.get(endPoint: 'products');
      // print("response = $response");
      return Right(
        (response.data as List).map((e) => Product.fromJson(e)).toList(),
      );
    } catch (e) {
      // print('error : $e');
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List>> getAllCategories() async {
    try {
      final response = await apiService.get(endPoint: 'products/categories');
      // print("response = $response");
      return Right(response.data);
    } catch (e) {
      // print('error : $e');
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategories(
      {required String categoryName}) async {
    try {
      final response =
          await apiService.get(endPoint: 'products/category/$categoryName');
      // print("response = $response");
      return Right(
        (response.data as List).map((e) => Product.fromJson(e)).toList(),
      );
    } catch (e) {
      // print('error : $e');
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

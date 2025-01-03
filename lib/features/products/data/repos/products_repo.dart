import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/product/product.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<dynamic>>> getAllCategories();
  Future<Either<Failure, List<Product>>> getCategories(
      {required String categoryName});

  Future<Either<Failure, Product>> addProduct({required Product product});
  Future<Either<Failure, Product>> updateProduct({required Product product});
}

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/product/product.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<Product>>> getAllProducts();
}

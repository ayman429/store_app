import 'package:get_it/get_it.dart';

import '../features/products/data/repos/products_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<ProductsRepoImpl>(ProductsRepoImpl(
    getIt.get<ApiService>(),
  ));
}

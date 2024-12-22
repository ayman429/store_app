import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/service_locator.dart';
import '../../data/repos/products_repo_impl.dart';
import '../manager/get_products_cubit/get_products_cubit.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit(
        getIt<ProductsRepoImpl>(),
      )..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: const Center(child: ShowProducts()),
      ),
    );
  }
}

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProductsSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text(product.price.toString()),
              );
            },
          );
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}

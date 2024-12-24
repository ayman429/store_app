import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/service_locator.dart';
import '../../data/models/product/product.dart';
import '../../data/repos/products_repo_impl.dart';
import '../manager/update_product_cubit/update_product_cubit.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProductCubit(
        getIt<ProductsRepoImpl>(),
      )..updateProduct(
          product: const Product(
              id: 1,
              title: "title2",
              price: 15.0,
              description: "description1",
              category: "category1",
              image: "https://i.pravatar.cc")),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: const Center(child: ShowUpdateProduct()),
      ),
    );
  }
}

class ShowUpdateProduct extends StatelessWidget {
  const ShowUpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProductCubit, UpdateProductState>(
      builder: (context, state) {
        if (state is UpdateProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UpdateProductSuccess) {
          final product = state.product;
          return ListTile(
            title: Row(
              children: [
                Text('id: ${product.id}, '),
                Text('title: ${product.title}'),
              ],
            ),
            subtitle: Text(product.price.toString()),
          );
        } else if (state is UpdateProductFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}

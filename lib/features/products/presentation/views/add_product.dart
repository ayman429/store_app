import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/service_locator.dart';
import '../../data/models/product/product.dart';
import '../../data/repos/products_repo_impl.dart';
import '../manager/add_product_cubit/add_product_cubit.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        getIt<ProductsRepoImpl>(),
      )..addProduct(
          product: const Product(
              title: "title2",
              price: 15.0,
              description: "description1",
              category: "category1",
              image: "https://i.pravatar.cc")),
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
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        if (state is AddProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddProductSuccess) {
          final product = state.product;
          return ListTile(
            title: Text(product.title ?? ""),
            subtitle: Text(product.price.toString()),
          );
        } else if (state is AddProductFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}

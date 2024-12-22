import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/service_locator.dart';
import '../../data/repos/products_repo_impl.dart';
import '../manager/get_categories_cubit/get_categories_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoriesCubit(
        getIt<ProductsRepoImpl>(),
      )..getCategories(categoryName: "jewelery"),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: const Center(child: ShowCategories()),
      ),
    );
  }
}

class ShowCategories extends StatelessWidget {
  const ShowCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetCategoriesSuccess) {
          return ListView.builder(
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final categories = state.categories[index];
              return ListTile(
                title: Text(categories.title ?? ""),
                subtitle: Text(categories.price.toString()),
              );
            },
          );
        } else if (state is GetCategoriesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}

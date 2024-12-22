import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/service_locator.dart';
import '../../data/repos/products_repo_impl.dart';
import '../manager/get_all_categories_cubit/get_all_categories_cubit.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCategoriesCubit(
        getIt<ProductsRepoImpl>(),
      )..getAllCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AllCategories'),
        ),
        body: const Center(child: ShowAllCategories()),
      ),
    );
  }
}

class ShowAllCategories extends StatelessWidget {
  const ShowAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllCategoriesSuccess) {
          return ListView.builder(
            itemCount: state.allCategories.length,
            itemBuilder: (context, index) {
              final categories = state.allCategories[index];
              return ListTile(
                title: Text(categories),
              );
            },
          );
        } else if (state is GetAllCategoriesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}

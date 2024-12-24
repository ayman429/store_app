// ignore_for_file: public_member_api_docs, sort_constructors_first
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
          title: const Text('New Trend'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
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
          return Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 10, end: 10, top: 65),
            child: GridView.builder(
              clipBehavior: Clip.none,
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 60,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return CustomCard(
                  title: product.title.toString().substring(0, 5),
                  price: product.price.toString(),
                  image: product.image.toString(),
                );
              },
            ),
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

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 50, start: 10, end: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$" + price),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              )),
        ),
        Positioned(
          top: -40,
          right: 15,
          child: Image.network(
            image,
            height: 80,
            width: 80,
          ),
        ),
      ],
    );
  }
}

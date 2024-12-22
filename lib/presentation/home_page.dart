import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../util/routes.dart';
import '../core/cubits/app_theme_cubit/app_theme_cubit.dart';
import '../core/cubits/localization_cubit/localization_cubit.dart';
import '../generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text("change Theme"),
              onPressed: () {
                try {
                  BlocProvider.of<AppThemeCubit>(context).toggle();
                } catch (e) {
                  print("error = $e");
                }
              },
            ),
            MaterialButton(
              child: const Text("change Lang"),
              onPressed: () {
                try {
                  BlocProvider.of<LocalizationCubit>(context).toggle();
                } catch (e) {
                  print("error = $e");
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, AppRoutes.productsHome);
              },
              child: const Text("Go to ProductsHome Page"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, AppRoutes.allCategories);
              },
              child: const Text("Go to allCategories Page"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, AppRoutes.categories);
              },
              child: const Text("Go to Categories Page"),
            ),
          ],
        ),
      ),
    );
  }
}

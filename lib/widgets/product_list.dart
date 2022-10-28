import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_provider.dart';
import '../widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future:
            Provider.of<Products>(context, listen: false).fetchAndSetProducts(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return const Center(
                child: Text('An error occurred!'),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Consumer<Products>(
                  builder: (ctx, productData, child) => ListView.builder(
                    itemCount: productData.items.length,
                    itemBuilder: (ctx, i) =>
                        ProductItem(productData.items[i]),
                  ),
                ),
              );
            }
          }
        },
      );
  }
}
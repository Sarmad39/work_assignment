import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product productData;
  const ProductItem(this.productData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 153,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData.title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle1!.color,
                      fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.subtitle1!.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Next Delivery'),
                  Text(productData.date),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Starting \$ ${productData.price}/week',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -30,
              child: SizedBox(
                height: 150,
                child: Image.network(
                  productData.imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../provider/products_provider.dart';

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
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
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: Consumer<Products>(
                      builder: (ctx, productData, child) => ListView.builder(
                        itemCount: productData.items.length,
                        itemBuilder: (ctx, i) =>
                            ProductItem(productData.items[i]),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 4,
                      left: 30,
                      right: 30,
                      child: buildMyNavBar(context)),
                ],
              );
            }
          }
        },
      ),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(width: 1,style: BorderStyle.solid,color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delivery_dining,color: Colors.white,)),
              const Text('Delivery')
            ],
          ),
           Column(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.feed,color: Colors.lightBlue,)),
              const Text('Plans')
            ],
          ),
           Column(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.person  ,color: Colors.white,)),
              const Text('Profile')
            ],
          )
        ],
      ),
    );
  }

  PreferredSize _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            CircleAvatar(
              radius: 25,
              child: Image.asset('assets/images/logo.jpg',fit: BoxFit.fill,height: 50,width: 50,),
            ),
           const Text(
              'My Plans',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            CircleAvatar(
              radius: 25,
              child: Image.asset('assets/images/image.png',fit: BoxFit.contain,height: 50,width: 50,),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/product_list.dart';
import '../widgets/bottom_Nav_Bar.dart';

class MyPlanScreen extends StatelessWidget {
  const MyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: const [
          ProductList(),
          Positioned(
            bottom: 10,
            left: 30,
            right: 30,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }

  PreferredSize _appbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(10, 10, 10, 1)),
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const Text(
                'My Plans',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(146, 88, 186, 1),
                    Color.fromRGBO(6, 133, 170, 1),
                  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                ),
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/image.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

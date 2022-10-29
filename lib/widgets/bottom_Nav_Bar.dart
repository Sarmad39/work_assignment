// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  Widget _buildMyButton(Icon icon, String title,) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMyButton(const Icon(Icons.delivery_dining,color: Colors.white,), "Delivery", ),
          _buildMyButton(const Icon(Icons.feed,color: Colors.blue,) ,"Plans", ),
          _buildMyButton(const Icon(Icons.person,color: Colors.white,), "Profile", ),
        ],
      ),
    );
  }
}

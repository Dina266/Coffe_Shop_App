import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: AppColors.splashBackground),
            onPressed: _decrement,
          ),
          Text(
            '$_count',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.splashBackground),
            onPressed: _increment,
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _count = 1;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 1) {
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
      padding: const EdgeInsets.symmetric(
          horizontal: 8),
      height: 40, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.orange),
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
            icon: const Icon(Icons.add, color: Colors.orange),
            onPressed: _increment,
          ),
        ],
      ),
    );
  }
}

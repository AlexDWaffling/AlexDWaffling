import 'package:flutter/material.dart';

class logoBar extends StatelessWidget{
   @override
    Widget build(BuildContext context){        
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepOrangeAccent,
            ),
            child: const Icon(
              Icons.fastfood,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'POSBOT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
import 'package:flutter/material.dart';

class itemTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final tap;
  const itemTab({
    required this.icon, 
    required this.title, 
    required this.isActive,
    this.tap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 139,
        margin: const EdgeInsets.only(right: 26),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f2029),
          border: isActive
              ? Border.all(color: Colors.deepOrangeAccent, width: 3)
              : Border.all(color: const Color(0xff1f2029), width: 3),
        ),
        child: Row(
          children: [
            // Image.asset(
            //   icon,
            //   width: 38,
            // ),
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

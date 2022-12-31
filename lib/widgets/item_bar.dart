import 'package:flutter/material.dart';

class itemBar extends StatelessWidget{
  final String menu;
  final IconData icon;
  final tap_state;
  const itemBar({
    required this.menu,
    required this.icon,
    this.tap_state,
  });
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: InkWell(
        onTap: tap_state,
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: pageActive == menu
                //     ? Colors.deepOrangeAccent
                //     : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
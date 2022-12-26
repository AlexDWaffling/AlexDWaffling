import 'package:flutter/material.dart';
import 'package:flutter_pos_app/widgets/logo_bar.dart';
import 'package:flutter_pos_app/widgets/item_bar.dart';
import 'package:flutter_pos_app/models/model_bar.dart';
import 'package:provider/provider.dart';

class sideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(children: [
      logoBar(),
      const SizedBox(height: 20),
      Expanded(
        // child: Consumer<ItemModelBar>(
        //       builder: (context, value, child){
        //         return Column(
        //           children: [
        //             logoBar(),
        //             const SizedBox(height: 20),
        //             ListView.builder(
        //               itemCount: value.main_items_bar.length,
        //               itemBuilder: (context,index){
        //                 return itemBar(
        //                   menu: value.main_items_bar[index][0], 
        //                   icon: value.main_items_bar[index][1], 
        //                   // tap_state: ,
        //                 );
        //               }
        //             ),
        //           ]
        //         );
        //       }
        //     )
    
        child: ListView(
          children: const [
            itemBar(
              menu: 'Home',
              icon: Icons.rocket_sharp),
            itemBar(
              menu: 'Menu',
              icon: Icons.format_list_bulleted_rounded),
            itemBar(
              menu: 'History',
              icon: Icons.history_toggle_off_rounded),
            itemBar(
              menu: 'Promos',
              icon: Icons.discount_outlined),
            itemBar(
              menu: 'Settings',
              icon: Icons.sports_soccer_outlined),
          ],
        ),
      ),
    ]);
  }
}

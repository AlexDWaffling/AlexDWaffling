import 'package:flutter/material.dart';
import 'package:flutter_pos_app/controllers/productController.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_pos_app/home.dart';
import 'package:flutter_pos_app/models/model_bar.dart';
import 'package:flutter_pos_app/widgets/item_bar.dart';
import 'package:flutter_pos_app/widgets/logo_bar.dart';

import 'database/database.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  //  ProducsController();
  initServices();
  runApp(const MyApp());
}

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<AppDatabase>(() => AppDatabase.init());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemModelBar(),
      child: const MaterialApp(
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'Home':
        return const HomePage();
      case 'Menu':
        return Container();
      case 'History':
        return Container();
      case 'Promos':
        return Container();
      case 'Settings':
        return Container();

      default:
        return const HomePage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Row(
        children: [
          Container(
              width: 70,
              padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
              height: MediaQuery.of(context).size.height,
              // child: sideBar(),
              child: Consumer<ItemModelBar>(builder: (context, value, child) {
                return Column(children: [
                  logoBar(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.main_items_bar.length,
                        itemBuilder: (context, index) {
                          return itemBar(
                            menu: value.main_items_bar[index][0],
                            icon: value.main_items_bar[index][1],
                            tap_state: () =>
                                _setPage(value.main_items_bar[index][0]),
                          );
                        }),
                  )
                ]);
              })),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Color(0xff17181f),
              ),
              child: _pageView(),
            ),
          ),
        ],
      ),
    );
  }
}

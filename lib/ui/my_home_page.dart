
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/business/marketing.dart';
import 'package:flutter_riverpod_shop/ui/badge_screen.dart';

import '../business/providers.dart';
import '../data/model/menu.dart';
import 'home_page_item.dart';



class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    List<CoffeMenu> menuList = ref.watch(menuProvider);
    MenuNotifier menuNotifier = ref.watch(menuProvider.notifier);
    BadgeNotifier badgeNotifier=ref.watch(badgeProvider.notifier);
    int badgeCount=ref.watch(badgeProvider).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading:Badge(
            badgeContent: Text('$badgeCount'),
            position: const BadgePosition(start: 26, bottom: 26),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const BadgeScreen();
                }));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),

      ),
      body: GridView.count(
          shrinkWrap: true,
          //primary: false,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: menuList.map(
            (menu) {
              return HomePageItem(menu: menu,menuNotifier: menuNotifier,badgeNotifier: badgeNotifier,);
            },
          ).toList()),
    );
  }
}

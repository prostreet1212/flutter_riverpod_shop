import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/business/marketing.dart';
import 'package:flutter_riverpod_shop/ui/badge_screen.dart';

import '../business/providers.dart';
import '../data/model/menu.dart';
import '../data/list_menu.dart';



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
            badgeContent: Text('${badgeCount.toString()}'),
            position: const BadgePosition(start: 26, bottom: 26),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return BadgeScreen();
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
              return Card(
                  color: Color.fromARGB(255, 255, 229, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Wrap(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/${menu.image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 174, 206, 231),
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_basket,
                                      color:
                                      !menu.isBuy ? Colors.grey : Colors.red,
                                    ),
                                    onPressed: () {
                                      //ref.read(menuProvider.notifier).buyNot(menu);
                                      //ref.read(badgeProvider.notifier).state.add(menu);
                                      menuNotifier.buyNot(menu);
                                      badgeNotifier.changBadgeCount(menu);
                                    },
                                  ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            menu.name,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Цена: '),
                              Text(
                                '${menu.price} руб.',
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
            },
          ).toList()),
    );
  }
}

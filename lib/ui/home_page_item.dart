import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business/marketing.dart';
import '../data/model/menu.dart';

class HomePageItem extends ConsumerWidget {
  const HomePageItem(
      {super.key,
      required this.menu,
      required this.menuNotifier,
      required this.badgeNotifier});

  final CoffeMenu menu;
  final MenuNotifier menuNotifier;
  final BadgeNotifier badgeNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: const Color.fromARGB(255, 255, 229, 85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                    color: const Color.fromARGB(255, 174, 206, 231),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_basket,
                        color: !menu.isBuy ? Colors.grey : Colors.red,
                      ),
                      onPressed: () {
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
              const SizedBox(
                height: 7,
              ),
              Text(
                menu.name,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Цена: '),
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
  }
}

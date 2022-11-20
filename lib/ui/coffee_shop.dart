import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../business/marketing.dart';
import '../business/providers.dart';
import '../data/model/menu.dart';

class CoffeeShop extends ConsumerWidget {
  const CoffeeShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeMenu> menuList = ref.watch(menuProvider);
    MenuNotifier menuNotifier = ref.watch(menuProvider.notifier);
    BadgeNotifier badgeNotifier = ref.watch(badgeProvider.notifier);


    return GridView.count(
      shrinkWrap: true,
      //primary: false,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.5),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: menuList
          .map(
            (menu) => Card(
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
                            child:
                            IconButton(
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
            ),
          )
          .toList(),
    );
  }
}

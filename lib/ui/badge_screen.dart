import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';

import '../business/marketing.dart';
import '../business/providers.dart';
import '../data/model/menu.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeMenu> badgeList=ref.watch(badgeProvider);
    BadgeNotifier badgeNotifier=ref.watch(badgeProvider.notifier);
    MenuNotifier menuNotifier = ref.watch(menuProvider.notifier);
    List<CoffeMenu> menuList = ref.watch(menuProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: badgeList.length == 0
          ? Center(
        child: Text(
          'Корзина пуста',
          style: TextStyle(fontSize: 24),
        ),
      )
          : Column(
        children: [
          Expanded(
              flex: 12,
              child: ListView.builder(
                  itemCount: badgeList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/${badgeList[index].image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                            badgeList[index]
                                            .name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                          'Цена: ${badgeList[index].price} руб.',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  })),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.black),
                ),
                child: Text(
                  'Оформить заказ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  badgeNotifier.clearBadge();
                  menuNotifier.clearBuyStatus();
                  Navigator.pop(context);
                  showToast('Заказ успешно выполнен');
                },
              ),
            ),
          )
        ],
      ),
    );
  }


}
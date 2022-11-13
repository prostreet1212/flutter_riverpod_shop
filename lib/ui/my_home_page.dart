import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/business/marketing.dart';

import '../data/model/menu.dart';
import '../data/list_menu.dart';

//final counterProvider=StateNotifierProvider<Counter,int>((_) => Counter());

final counterProvider=StateNotifierProvider<Counter,List<CoffeMenu>>((_) => Counter(ListMenu()));

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeMenu> count=ref.watch(counterProvider);
    final provider=ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: /*FutureBuilder(
          future: count,
          builder: (context, snapshot) {
            var listMenu = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка загрузки'),
                  );
                } else {
                  return
                }
              default:
                return Container();
            }
          }),*/
      GridView.count(
          shrinkWrap: true,
          //primary: false,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 10, bottom: 10),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: count!.map(
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
                                color: Color.fromARGB(
                                    255, 174, 206, 231),
                                height: 40,
                                width: 40,
                                child:IconButton(
                                  icon: Icon(
                                    Icons.shopping_basket,
                                    color: !menu.isBuy
                                        ? Colors.grey
                                        : Colors.red,
                                  ),
                                  onPressed: () {
                                    provider.buyNot(menu);
                                  },
                                )
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
                          mainAxisAlignment:
                          MainAxisAlignment.center,
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

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
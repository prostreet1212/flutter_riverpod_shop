import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/data/list_menu.dart';

import '../data/model/menu.dart';

class Counter extends StateNotifier<List<CoffeMenu>>{
  final ListMenu list;
  Counter(this.list):super([]){
    init();
  }
  void init() {
    state= list.getListMenu();
  }

  void buyNot(CoffeMenu cofee){
    cofee.isBuy=!cofee.isBuy;
   state=state.map((e) => e.name==cofee.name?cofee:e).toList();

  }

}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/data/list_menu.dart';

import '../data/model/menu.dart';

class MenuNotifier extends StateNotifier<List<CoffeMenu>>{
  final ListMenu list;
  MenuNotifier(this.list):super([]){
    init();
  }
  void init() {
    state= list.getListMenu();
  }

  void buyNot(CoffeMenu cofee){
   state=state.map((e) {
     if(e==cofee){
       e.isBuy=!e.isBuy;
       return e;
     }else{
       return e;
     }
   }).toList();
  }

  void clearBuyStatus(){
    state=state.map((e) {
      if(e.isBuy==true){
        e.isBuy=false;
        return e;
      }else{
        return e;
      }

    }).toList();
  }
}

class BadgeNotifier extends StateNotifier<List<CoffeMenu>>{
  //List<CoffeMenu> badgeList;

  BadgeNotifier() : super([]);

  /*List<CoffeMenu> getBadge() {
    return badgeList;
  }*/

  void changBadgeCount(CoffeMenu cofee) {

    if (cofee.isBuy) {
      state.add(cofee);

    } else {
      state.remove(cofee);
    }
  }

  void clearBadge() {
    state.clear();


  }



}
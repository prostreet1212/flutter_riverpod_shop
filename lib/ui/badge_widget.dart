import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../business/providers.dart';
import 'badge_screen.dart';

class BadgeWidget extends ConsumerWidget{

  const BadgeWidget({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int badgeCount = ref.watch(badgeProvider).length;

return Builder(builder: (context){
  return Badge(
    badgeContent: Text(badgeCount.toString()),
    position: const BadgePosition(start: 26, bottom: 26),
    child: IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const BadgeScreen();
        }));
      },
      icon: const Icon(Icons.shopping_cart),
    ),
  );
});

  }


}
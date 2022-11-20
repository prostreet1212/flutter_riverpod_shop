import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shop/ui/badge_widget.dart';
import 'coffee_shop.dart';




class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: const BadgeWidget(),
      ),
      body: const CoffeeShop(),
    );
  }
}

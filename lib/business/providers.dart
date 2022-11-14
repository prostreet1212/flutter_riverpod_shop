import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/list_menu.dart';
import '../data/model/menu.dart';
import 'marketing.dart';

final menuProvider =
StateNotifierProvider<MenuNotifier, List<CoffeMenu>>((_) => MenuNotifier(ListMenu()));
final badgeProvider=StateNotifierProvider<BadgeNotifier,List<CoffeMenu>>((_) => BadgeNotifier());


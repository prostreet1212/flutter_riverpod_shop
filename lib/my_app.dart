import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';

import 'ui/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: OKToast(
          textStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
          backgroundColor: const Color.fromARGB(113, 145, 148, 139),
          position: ToastPosition.bottom,
          textPadding: const EdgeInsets.all(8),
          duration: const Duration(seconds: 3),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        )
    )
    ;
  }
}
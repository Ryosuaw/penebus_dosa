import 'package:flutter/material.dart';

import 'detail_screen/home_screen.dart';
import 'detail_screen/rx_screen.dart';
import 'detail_screen/tx_screen.dart';
import 'detail_screen/grafik_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pemantauan Trafik Jaringan",

      home: const HomeScreen(),

      routes: {
        "/rx": (context) => const RxScreen(),
        "/tx": (context) => const TxScreen(),
        "/grafik": (context) => const GrafikScreen(),
      },
    );
  }
}
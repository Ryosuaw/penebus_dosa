import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMonitoring = false;

  double rx = 0;
  double tx = 0;

  Timer? timer;

  Random random = Random();

  void startMonitoring() {
    if (isMonitoring) return;

    isMonitoring = true;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        rx = (50 + random.nextInt(451)).toDouble();

tx = (50 + random.nextInt(451)).toDouble();
      });
    });

    setState(() {});
  }

  void stopMonitoring() {
    timer?.cancel();

    setState(() {
      isMonitoring = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemantauan Trafik Jaringan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.download, color: Colors.blue),
                title: const Text("RX"),
                subtitle: Text("${rx.toStringAsFixed(0)} Mbps"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, "/rx"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.upload, color: Colors.green),
                title: const Text("TX"),
                subtitle: Text("${tx.toStringAsFixed(0)} Mbps"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, "/tx"),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Status : ${isMonitoring ? "ON" : "OFF"}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: startMonitoring,
                  child: const Text("Start"),
                ),
                ElevatedButton(
                  onPressed: stopMonitoring,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("Stop"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/grafik"),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Grafik Trafik Jaringan\n(Klik di sini)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
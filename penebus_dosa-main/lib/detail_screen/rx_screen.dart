import 'package:flutter/material.dart';

class RxScreen extends StatefulWidget {
  const RxScreen({super.key});

  @override
  State<RxScreen> createState() => _RxScreenState();
}

class _RxScreenState extends State<RxScreen> {

  double rx = 0;

  void refreshData() {
    setState(() {
      rx = 100 + (DateTime.now().second * 5);
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Monitoring RX"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.download,
                  color: Colors.blue,
                ),

                title: const Text("Receive"),

                subtitle: Text("${rx.toStringAsFixed(0)} Mbps"),

              ),

            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: refreshData,

              child: const Text("Refresh"),

            ),

          ],

        ),

      ),

    );

  }

}
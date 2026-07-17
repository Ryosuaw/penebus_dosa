import 'package:flutter/material.dart';

class TxScreen extends StatefulWidget {
  const TxScreen({super.key});

  @override
  State<TxScreen> createState() => _TxScreenState();
}

class _TxScreenState extends State<TxScreen> {

  double tx = 0;

  void refreshData() {
    setState(() {
      tx = 100 + (DateTime.now().second * 4);
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
        title: const Text("Monitoring TX"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.upload,
                  color: Colors.green,
                ),

                title: const Text("Transmit"),

                subtitle: Text("${tx.toStringAsFixed(0)} Mbps"),

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
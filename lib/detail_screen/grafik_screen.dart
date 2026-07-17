import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikScreen extends StatelessWidget {
  const GrafikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grafik Trafik"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "Grafik RX & TX",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),

                  borderData: FlBorderData(show: true),

                  lineBarsData: [

                    // RX
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 100),
                        FlSpot(1, 180),
                        FlSpot(2, 120),
                        FlSpot(3, 250),
                        FlSpot(4, 200),
                        FlSpot(5, 320),
                      ],
                      isCurved: true,
                      barWidth: 3,
                    ),

                    // TX
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 80),
                        FlSpot(1, 150),
                        FlSpot(2, 200),
                        FlSpot(3, 170),
                        FlSpot(4, 280),
                        FlSpot(5, 260),
                      ],
                      isCurved: true,
                      barWidth: 3,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali"),
            )

          ],
        ),
      ),
    );
  }
}
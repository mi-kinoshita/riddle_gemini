import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int>? datasets;

  const MyHeatMap({
    super.key,
    required this.startDate,
    required this.datasets,
  });

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: datasets,
      colorMode: ColorMode.color,
      defaultColor: Colors.indigo,
      textColor: Colors.white,
      showText: true,
      scrollable: true,
      size: 30,
      colorsets: {
        1: Colors.lightBlue.shade100,
        2: Colors.lightBlue.shade200,
        3: Colors.lightBlue.shade300,
        4: Colors.lightBlue.shade400,
        5: Colors.lightBlue.shade500,
      },
    );
  }
}

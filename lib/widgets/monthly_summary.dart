import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
//import 'package:hive_task/datetime/date_time.dart';
import 'package:todoappu/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.black.withOpacity(0.6),
        showColorTip: false,
        showText: true,

        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(20, 13, 71, 161),
          2: Color.fromARGB(40, 13, 71, 161),
          3: Color.fromARGB(60, 13, 71, 161),
          4: Color.fromARGB(80, 13, 71, 161),
          5: Color.fromARGB(100, 13, 71, 161),
          6: Color.fromARGB(120, 13, 71, 161),
          7: Color.fromARGB(150, 13, 71, 161),
          8: Color.fromARGB(180, 13, 71, 161),
          9: Color.fromARGB(220, 13, 71, 161),
          10: Color.fromARGB(255, 13, 71, 161),
        },
        //onClick: (value) {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
        onClick: (value) {},
      ),
    );
  }
}

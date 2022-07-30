import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class report extends StatefulWidget {
  int food = 0;
  int trans = 0;
  int enter = 0;
  int bills = 0;
  int med = 0;
  int other = 0;
  report(
      {required this.food,
      required this.trans,
      required this.enter,
      required this.bills,
      required this.med,
      required this.other});
  @override
  State<report> createState() => _reportState(
      food: food,
      trans: trans,
      enter: enter,
      bills: bills,
      med: med,
      other: other);
}

class _reportState extends State<report> {
  int food = 0;
  int trans = 0;
  int enter = 0;
  int bills = 0;
  int med = 0;
  int other = 0;
  _reportState(
      {required this.food,
      required this.trans,
      required this.enter,
      required this.bills,
      required this.med,
      required this.other});
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Food": food.toDouble(),
      "Transport": trans.toDouble(),
      "Entertainment": enter.toDouble(),
      "Bills": bills.toDouble(),
      "Medicine": med.toDouble(),
      "Other": other.toDouble()
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: PieChart(
          dataMap: dataMap,
          chartRadius: 350,
          legendOptions: LegendOptions(
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(fontSize: 20,
              color: Colors.white,
              )),
          chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValueBackground: false,
              chartValueStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 70, 70),
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

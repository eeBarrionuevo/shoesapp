import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardAdminPage extends StatelessWidget {
  List<ChartData> data = [
    ChartData("Lunes", 50),
    ChartData("Martes", 30),
    ChartData("Miercoles", 40),
    ChartData("Jueves", 20),
    ChartData("Viernes", 30),
    ChartData("Sábado", 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.secondaryColor,
        title: H4(
          text: "Dashboard",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SfCartesianChart(
              tooltipBehavior: TooltipBehavior(enable: true),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
              series: <ChartSeries<ChartData, String>>[
                ColumnSeries(
                  dataSource: data,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10.0),
                  enableTooltip: true,
                ),
                ColumnSeries(
                  dataSource: data,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                  enableTooltip: true,
                ),
                ColumnSeries(
                  dataSource: data,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0),
                  enableTooltip: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(this.x, this.y);
}

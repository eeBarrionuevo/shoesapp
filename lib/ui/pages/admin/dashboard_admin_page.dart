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
            SfCircularChart(
              tooltipBehavior: TooltipBehavior(
                enable: true,
              ),
              legend: Legend(
                isVisible: true,
                title: LegendTitle(
                  text: "Resumen",
                ),
              ),
              series: [
                DoughnutSeries<ChartData, String>(
                  dataSource: data,
                  // pointColorMapper: (datum, index) => Colors.blue,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                  enableTooltip: true,
                  name: "Día",
                  radius: "80%",
                  explode: true,
                  explodeIndex: 3,
                ),
              ],
            ),
            const Text(
              'Activity',
              style: TextStyle(
                color: BrandColor.primaryFontColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            LegendsListWidget(
              legends: [
                LegendModel('Pilates', Colors.red),
                LegendModel('Quick workouts', Colors.blue),
                LegendModel('Cycling', Colors.amber),
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

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          style: const TextStyle(
            color: Color(0xff757391),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class LegendsListWidget extends StatelessWidget {
  const LegendsListWidget({
    super.key,
    required this.legends,
  });
  final List<LegendModel> legends;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: legends
          .map(
            (e) => LegendWidget(
              name: e.name,
              color: e.color,
            ),
          )
          .toList(),
    );
  }
}

class LegendModel {
  LegendModel(this.name, this.color);
  final String name;
  final Color color;
}

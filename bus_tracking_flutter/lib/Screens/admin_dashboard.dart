import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart';
import '../../main.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  List<Bus> _allBuses = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchBusData();
  }

  Future<void> _fetchBusData() async {
    try {
      List<Bus> buses = await client.bus.getAllBuses();
      setState(() {
        _allBuses = buses;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Admin Dashboard",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade700,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.white,
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _fetchBusData,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildChartCard(
              title: "Bus Status",
              icon: Icons.directions_bus,
              chartBuilder: _buildBusStatusPieChart,
              legend: _buildStatusLegend(),
            ),
            SizedBox(height: 20),
            _buildChartCard(
              title: "Bus Age Distribution",
              icon: Icons.timelapse,
              chartBuilder: _buildBusAgePieChart,
              legend: _buildAgeLegend(),
            ),
            SizedBox(height: 20),
            // _buildChartCard(
            //   title: "Breakdown Counts",
            //   icon: Icons.report_problem,
            //   chartBuilder: _buildBreakdownBarChart,
            //   legend: SizedBox.shrink(),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard({
    required String title,
    required IconData icon,
    required Widget Function(BoxConstraints constraints) chartBuilder,
    required Widget legend,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isDark ? Colors.grey[800] : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green.shade700,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                double chartHeight = constraints.maxWidth;
                return Container(
                  height: chartHeight * 0.7,
                  child: chartBuilder(constraints),
                );
              },
            ),
            SizedBox(height: 16),
            legend,
          ],
        ),
      ),
    );
  }

  Widget _buildBusStatusPieChart(BoxConstraints constraints) {
    Map<String, int> statusCounts = {
      'Operating': 0,
      'In Maintenance': 0,
      'Out of Service': 0,
    };

    for (var bus in _allBuses) {
      statusCounts[bus.status] = (statusCounts[bus.status] ?? 0) + 1;
    }

    int total = statusCounts.values.fold(0, (a, b) => a + b);
    if (total == 0) {
      return Center(child: Text('No Data', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color)));
    }

    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: constraints.maxWidth * 0.2,
        startDegreeOffset: -90,
        sections: statusCounts.entries.map((entry) {
          double percentage = entry.value / total * 100;
          Color color;
          switch (entry.key) {
            case 'Operating':
              color = Colors.greenAccent.shade400;
              break;
            case 'In Maintenance':
              color = Colors.orangeAccent.shade400;
              break;
            case 'Out of Service':
              color = Colors.redAccent.shade400;
              break;
            default:
              color = Colors.grey;
          }

          return PieChartSectionData(
            color: color,
            value: entry.value.toDouble(),
            title: '${percentage.toStringAsFixed(1)}%',
            radius: constraints.maxWidth * 0.15,
            titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatusLegend() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLegendItem(Colors.greenAccent.shade400, 'Operating'),
        _buildLegendItem(Colors.orangeAccent.shade400, 'In Maintenance'),
        _buildLegendItem(Colors.redAccent.shade400, 'Out of Service'),
      ],
    );
  }

  Widget _buildBusAgePieChart(BoxConstraints constraints) {
    int group1 = _allBuses.where((b) => b.age >= 0 && b.age <= 3).length;
    int group2 = _allBuses.where((b) => b.age >= 4 && b.age <= 6).length;
    int group3 = _allBuses.where((b) => b.age >= 7).length;

    int total = group1 + group2 + group3;
    if (total == 0) {
      return Center(child: Text('No Data', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color)));
    }

    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: constraints.maxWidth * 0.2,
        startDegreeOffset: -90,
        sections: [
          PieChartSectionData(
            color: Colors.blueAccent.shade400,
            value: group1.toDouble(),
            title: '${(group1 / total * 100).toStringAsFixed(1)}%',
            radius: constraints.maxWidth * 0.15,
            titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.amber.shade400,
            value: group2.toDouble(),
            title: '${(group2 / total * 100).toStringAsFixed(1)}%',
            radius: constraints.maxWidth * 0.15,
            titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.deepPurpleAccent.shade400,
            value: group3.toDouble(),
            title: '${(group3 / total * 100).toStringAsFixed(1)}%',
            radius: constraints.maxWidth * 0.15,
            titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLegendItem(Colors.blueAccent.shade400, '0-3 yrs'),
        _buildLegendItem(Colors.amber.shade400, '4-6 yrs'),
        _buildLegendItem(Colors.deepPurpleAccent.shade400, '7+ yrs'),
      ],
    );
  }

  // Widget _buildBreakdownBarChart(BoxConstraints constraints) {
  //   List<BarChartGroupData> barGroups = [];
  //
  //   for (int i = 0; i < _allBuses.length; i++) {
  //     final bus = _allBuses[i];
  //     barGroups.add(
  //       BarChartGroupData(
  //         x: i,
  //         barRods: [
  //           BarChartRodData(
  //             toY: (bus.breakdownCounter).toDouble(),
  //             width: constraints.maxWidth / (_allBuses.length * 1.5),
  //             borderRadius: BorderRadius.circular(8),
  //             gradient: LinearGradient(
  //               colors: [Colors.redAccent, Colors.deepOrangeAccent],
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomCenter,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   double maxY = (_allBuses.map((b) => b.breakdownCounter).fold(0, (a, b) => a > b ? a : b) + 1).toDouble();
  //
  //   return BarChart(
  //     BarChartData(
  //       maxY: maxY,
  //       barGroups: barGroups,
  //       gridData: FlGridData(show: false),
  //       titlesData: FlTitlesData(
  //         leftTitles: AxisTitles(
  //           sideTitles: SideTitles(showTitles: true, reservedSize: 28),
  //         ),
  //         bottomTitles: AxisTitles(
  //           sideTitles: SideTitles(
  //             showTitles: true,
  //             getTitlesWidget: (value, meta) {
  //               if (value.toInt() >= _allBuses.length) return Container();
  //               return Padding(
  //                 padding: const EdgeInsets.only(top: 4.0),
  //                 child: Text(
  //                   _allBuses[value.toInt()].busNumber,
  //                   style: TextStyle(
  //                     fontSize: 10,
  //                     color: Theme.of(context).textTheme.bodyLarge!.color,
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       borderData: FlBorderData(show: false),
  //     ),
  //   );
  // }

  Widget _buildLegendItem(Color color, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}

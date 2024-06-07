import './../../res/colors/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class FluBarchart extends StatefulWidget {
  const FluBarchart({super.key, required this.dataList});
  final List dataList;
  @override
  State<FluBarchart> createState() => _FluBarchartState();
}

class _FluBarchartState extends State<FluBarchart> {
 
  List<BarChartGroupData> get barGroups => List.generate(widget.dataList.length, (index) => BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: widget.dataList[index]['value'],
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ));

//calculate max value
double maxValue = 0.0;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxCount();
  }
  
  late double maxfinal;
  maxCount(){
  double maxValue = widget.dataList.isNotEmpty ? widget.dataList.first['value'] ?? 0 : 0;

  for (var item in widget.dataList) {
    if (item['value'] > maxValue) {
      maxValue = item['value'];
    }
  }
  setState(() {
      maxfinal = maxValue;
  
  });
}



  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxfinal,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.only(left:5, right: 5, top:5),
          tooltipMargin: 10,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              textDirection: TextDirection.rtl,
              rod.toY.round().toString(),
               const TextStyle(
                color: AppColor.blackColor,
                fontSize: 12, fontWeight: FontWeight.w500
               ),
               children: [
               const TextSpan(text: ' ₹')
               ]
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    text = widget.dataList[value.toInt()]['title'].toString();
    
   
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          AppColor.blueLight,
           Color.fromARGB(255, 153, 187, 216),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

 
}


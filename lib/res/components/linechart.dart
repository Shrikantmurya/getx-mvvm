import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/utils.dart';
import '../colors/app_color.dart';

class LineChartShow extends StatefulWidget {
  const LineChartShow({super.key,  required this.dataList});
  final dataList;
  @override
  State<LineChartShow> createState() => _LineChartShowState();
}

class _LineChartShowState extends State<LineChartShow> {
 
List<FlSpot> MapPloatnew = [];
List<FlSpot> MapPloatnewExp = [];
double maxValue = double.minPositive;

 
  void initState() {
    // TODO: implement initState
    super.initState();
   maxLength();
  }
  maxLength(){

for (var entry in widget.dataList) {
  List<double> values = (entry['value'] as List<dynamic>).cast<double>();
  for (var value in values) {
    maxValue = value > maxValue ? value : maxValue;
  }
}
  }
  @override
  Widget build(BuildContext context) {
     List<FlSpot> earningList  = List.generate(widget.dataList.length, (index) => FlSpot( double.parse(index.toString()), ((widget.dataList[index]['value'][0] / maxValue) * 100.00) < 0.0 ? 0 : ((widget.dataList[index]['value'][0] / maxValue) * 100.00)) );
     List<FlSpot> expenceList  = List.generate(widget.dataList.length, (index) => FlSpot( double.parse(index.toString()), ((widget.dataList[index]['value'][1] / maxValue) * 100.00) < 0.0 ? 0 : ((widget.dataList[index]['value'][1] / maxValue) * 100.00)) );
    
     setState(() {
       MapPloatnew = earningList;
       MapPloatnewExp = expenceList;
     });
    return LineChart(
     sampleData1 ,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 12,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );



  Widget leftTitleWidgets(double value, TitleMeta meta) {
    
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
      if(10 == value.toInt()){
         text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
       else if(20 == value.toInt()){
          text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(30 == value.toInt()){
          text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(40 == value.toInt()){
         text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(50 == value.toInt()){
          text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(60 == value.toInt()){
          text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(70 == value.toInt()){
         text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(80 == value.toInt()){
          text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(90 == value.toInt()){
         text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else if(100 == value.toInt()){
         text =  (Utils.formatAmount((((maxValue/100)) * value.toInt())).toString());
      }
      else{
         return Container();
      }

 return Text(text, style: style, textAlign: TextAlign.center);
  }
  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
  
    Widget text;
    
    switch (value.toInt()) {
      case 0:
        text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 1:
        text =  Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 2:
       text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 3:
       text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 4:
        text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 5:
       text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 6:
       text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 7:
       text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 8:
        text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 9:
        text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 10:
         text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      case 11:
         text = Text(widget.dataList[value.toInt()]['title'], style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: AppColor.darkBlueColor.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
     
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: AppColor.greenColor,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: MapPloatnew
        
        //  const [
        //   //x and y axis
        //   FlSpot(1, 0),
        //   FlSpot(2, 1),
        //   FlSpot(3, 1.4),
        //   FlSpot(4, 3.4),
        //   FlSpot(5, 2),
        //   FlSpot(1, 2.2),
        //   FlSpot(1, 1),
        // ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue.withOpacity(0),
        ),
        spots: MapPloatnewExp
        
        // const [
        //   FlSpot(0, 9),
        //   FlSpot(3, 2.8),
        //   FlSpot(7, 1.2),
        //   FlSpot(1, 2.8),
        //   FlSpot(1, 2.6),
        //   FlSpot(1, 3.9),
        //   FlSpot(1, 1),
        //   FlSpot(3, 2.8),
        //   FlSpot(7, 1.2),
        //   FlSpot(1, 2.8),
        //   FlSpot(1, 2.6),
        //   FlSpot(1, 3.9),
        // ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Stack(
          children: <Widget>[
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 37,
                ),
                Text(
                  'Monthly Sales',
                  style: TextStyle(
                    color: AppColor.lightBlue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 37,
                ),
                
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:emochat/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> emoColors = <Color>[
  const Color(0xFFFFFC47),
  const Color(0xFFD9D63B),
  const Color(0xFFB3B12F),
  const Color(0xFF8D8B24),
  const Color(0xFF666518),
];

class EmoPieChart extends StatelessWidget {
  const EmoPieChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 280),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.02),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your emotions at a glance'),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PieChart(
                        PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: double.infinity,
                            sections: List.generate(5, (index) {
                              switch (index) {
                                case 0:
                                  return PieChartSectionData(
                                      showTitle: false,
                                      value: 45,
                                      color: emoColors[index]);
                                case 1:
                                  return PieChartSectionData(
                                      showTitle: false,
                                      value: 20,
                                      color: emoColors[index]);
                                case 2:
                                  return PieChartSectionData(
                                      showTitle: false,
                                      value: 15,
                                      color: emoColors[index]);
                                case 3:
                                  return PieChartSectionData(
                                      showTitle: false,
                                      value: 18,
                                      color: emoColors[index]);
                                case 4:
                                  return PieChartSectionData(
                                      showTitle: false,
                                      value: 2,
                                      color: emoColors[index]);
                                default:
                                  throw 'Oh boy!';
                              }
                            })),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return Expanded(
                          child: Indicator(
                            color: emoColors[index],
                            text: 'emotion ${index + 1}',
                            isSquare: false,
                          ),
                        );
                      }),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class PolarityLineChart extends StatelessWidget {
  const PolarityLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 250),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.02),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Daily',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2!.color,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText2!.fontFamily,
                    fontSize: 14,
                  ),
                  children: const [
                    TextSpan(text: ' emotional summary'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 7,
                    minY: 0,
                    maxY: 8,
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) =>
                          FlLine(strokeWidth: 0),
                      getDrawingVerticalLine: (value) => FlLine(
                        strokeWidth: 1,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                    ),
                    titlesData: FlTitlesData(
                        show: true,
                        leftTitles: SideTitles(showTitles: false),
                        topTitles: SideTitles(showTitles: false),
                        rightTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 48,
                          getTextStyles: (context, value) =>
                              const TextStyle(fontSize: 12),
                          getTitles: (value) {
                            switch (value.ceil()) {
                              case 0:
                                return 'negative';
                              case 4:
                                return 'neutral';
                              case 8:
                                return 'positive';
                              default:
                            }
                            return '';
                          },
                        ),
                        bottomTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 14,
                            getTextStyles: (context, value) =>
                                const TextStyle(fontSize: 12),
                            getTitles: (values) {
                              switch (values.toInt()) {
                                case 0:
                                  return 'MON';
                                case 7:
                                  return 'SUN';
                                default:
                              }
                              return '';
                            })),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(1, 2),
                          FlSpot(2, 5),
                          FlSpot(3, 3),
                          FlSpot(4, 4),
                          FlSpot(5, 3),
                          FlSpot(6, 4),
                          FlSpot(7, 5),
                        ],
                        dotData: FlDotData(
                          show: false,
                        ),
                        curveSmoothness: 0.3,
                        isStrokeCapRound: true,
                        colors: [Palette.primaryDark],
                        isCurved: true,
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [Palette.secondary.withOpacity(0.4)],
                        ),
                        aboveBarData: BarAreaData(
                          show: true,
                          colors: [Palette.secondary.withOpacity(0.4)],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
        )
      ],
    );
  }
}

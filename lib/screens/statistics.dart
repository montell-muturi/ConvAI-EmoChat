import 'package:emochat/components/charts.dart';
import 'package:emochat/components/navbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<Widget> graphs = [];

  @override
  void initState() {
    graphs = const [
      EmoPieChart(),
      PolarityLineChart(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const StatisticsNav(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListView.separated(
                            itemCount: graphs.length,
                            itemBuilder: (context, index) {
                              return graphs[index];
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          'assets/images/happy_ind.svg',
                          height: 80,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

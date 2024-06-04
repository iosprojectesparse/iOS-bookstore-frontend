//This is the longitudnal screen.

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../pro_state_mangement.dart';
import 'about_screen.dart';
import 'bottom_footer.dart';

class LongitudinalEvaluationScreen extends StatefulWidget {
  const LongitudinalEvaluationScreen({Key? key}) : super(key: key);

  @override
  State<LongitudinalEvaluationScreen> createState() => _LongitudinalEvaluationScreenState();
}

class _LongitudinalEvaluationScreenState extends State<LongitudinalEvaluationScreen> {
  bool isInternet = true;
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        isInternet = hasInternet;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    ProviderState providerstate = Provider.of<ProviderState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    List<_SalesData> data = [
      _SalesData('10', 35),
      _SalesData('20', 28),
      _SalesData('30', 34),
      _SalesData('40', 32),
      _SalesData('50', 40)
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Center(
          child: Text(
            providerstate.longitudinalevaluation,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff212121)),
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
            child: const Icon(
              Icons.info_rounded,
              color: Color(0xff212121),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 4,
        backgroundColor: const Color(0xffFDF7F2),
      ),
      backgroundColor: const Color(0xffFDF7F2),
      body: SafeArea(
        child: !isInternet
      ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: queryData.size.height * 0.4,
              width: queryData.size.width * 0.4,
              child: Image.asset(
                "images/icons/noInternet.png"
              ),
            ),
            const Text(
              "No Internet Access",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      )
      :Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: queryData.size.height * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xffFDF7F2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(2, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title

                        // Enable legend
                        legend: Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<_SalesData, String>>[
                          LineSeries<_SalesData, String>(
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) => sales.sales,
                              name: '',
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: false))
                        ]),
                  ),
                ),
              )
            ]),
            const BottomFooter()
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProdectDetails>(context, listen: false).getAllProdect();
  }

  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  final adidas = 'Adidas';
  final converse = 'Converse';
  final newbalance = 'Newbalance';
  final puma = 'Puma';
  final nike = 'Nike';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Product Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),

              // Pie Chart
              Consumer<ProdectDetails>(
                builder: (context, value, child) {
                  final getlist = value.getProdectDetals;
                  final adiidas =
                      getlist.where((take) => take.category == adidas);
                  final conv =
                      getlist.where((take) => take.category == converse);
                  final nb =
                      getlist.where((take) => take.category == newbalance);
                  final pm = getlist.where((take) => take.category == puma);
                  final nk = getlist.where((take) => take.category == nike);

                  final Map<String, double> dataMap = {
                    "Adidas": adiidas.length.toDouble(),
                    "Converse": conv.length.toDouble(),
                    "Newbalance": nb.length.toDouble(),
                    "Puma": pm.length.toDouble(),
                    'Nike': nk.length.toDouble(),
                  };

                  return PieChart(
                    dataMap: dataMap,
                    colorList: colorList,
                    chartRadius: MediaQuery.of(context).size.width / 2.2,
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: true,
                      decimalPlaces: 1,
                    ),
                  );
                },
              ),

              const Gap(30),
              // Title Text
              Text(
                TextConstant.details,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const Gap(20),
              // Product Category Info
              Consumer<ProdectDetails>(
                builder: (context, value, child) {
                  final getdatas = value.getProdectDetals;
                  final adidass =
                      getdatas.where((item) => item.category == adidas);
                  final newB =
                      getdatas.where((item) => item.category == newbalance);
                  final pumaaa =
                      getdatas.where((item) => item.category == puma);
                  final converese =
                      getdatas.where((item) => item.category == converse);
                  final nikee = getdatas.where((item) => item.category == nike);

                  return Column(
                    children: [
                      _categoryCard(adidass, "Adidas", Colors.blue),
                      _categoryCard(converese, "Converse", Colors.orange),
                      _categoryCard(newB, "Newbalance", Colors.green),
                      _categoryCard(pumaaa, "Puma", Colors.red),
                      _categoryCard(nikee, "Nike", Colors.yellow),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Card for displaying category info
  Widget _categoryCard(
      Iterable<Prodectmodel> givename, String name, Color colors) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              givename.length.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

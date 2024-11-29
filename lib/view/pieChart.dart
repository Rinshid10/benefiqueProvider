import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
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
        backgroundColor: mainBlueColor,
        title: const Text(
          "Pie chart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Gap(30),
          Consumer<ProdectDetails>(
            builder: (context, value, child) {
              final getlist = value.getProdectDetals;
              final adiidas =
                  getlist.where((take) => take.category == adidas);
              final conv =
                  getlist.where((take) => take.category == converse);
              final nb = getlist
                  .where((take) => take.category == newbalance);
              final pm =
                  getlist.where((take) => take.category == puma);
              final nk =
                  getlist.where((take) => take.category == nike);

              final Map<String, double> dataMap = {
                "Adidas": adiidas.length.toDouble(),
                "Converse": conv.length.toDouble(),
                "Newbalance": nb.length.toDouble(),
                "Puma": pm.length.toDouble(),
                'Nike': nk.length.toDouble(),
              };

              return PieChart(
                key: const Key("pie_chart"),
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
          textAoboshiOne2(
            text: TextConstant.details,
            fontSizes: 20,
            colors: Colors.black,
            fontw: FontWeight.bold,
          ),
          const Gap(20),
          Consumer<ProdectDetails>(
            builder: (context, value, child) {
              final getdatas = value.getProdectDetals;
              final adidass =
                  getdatas.where((getNumber) => getNumber.category == adidas);
              final newB = getdatas
                  .where((getNumber) => getNumber.category == newbalance);
              final pumaaa =
                  getdatas.where((getNumber) => getNumber.category == puma);
              final converese =
                  getdatas.where((getNumber) => getNumber.category == converse);
              final nikee =
                  getdatas.where((getNumber) => getNumber.category == nike);

              return Column(
                children: [
                  const Gap(10),
                  rowForText(
                    givename: adidass,
                    colors: Colors.blue,
                    name: TextConstant.adiasText,
                  ),
                  rowForText(
                    givename: converese,
                    colors: Colors.orange,
                    name: TextConstant.converseText,
                  ),
                  rowForText(
                    givename: newB,
                    colors: Colors.green,
                    name: TextConstant.newBalanceText,
                  ),
                  rowForText(
                    givename: pumaaa,
                    colors: Colors.red,
                    name: TextConstant.pumaText,
                  ),
                  rowForText(
                    givename: nikee,
                    colors: Colors.yellow,
                    name: TextConstant.nikeText,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Container rowForText({
    required Iterable<Prodectmodel> givename,
    required String name,
    required Color colors,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textAoboshiOne2(
            text: '$name:',
            fontSizes: 18,
            colors: Colors.black,
            fontw: FontWeight.bold,
          ),
          const Gap(20),
          textAoboshiOne2(
            text: givename.length.toString(),
            fontSizes: 20,
            colors: colors,
            fontw: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

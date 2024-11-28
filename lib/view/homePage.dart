import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/view/sell.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List colors = [
      Colors.red[50],
      Colors.blueGrey[50],
      Colors.teal[50],
      Colors.green[50],
      Colors.amber[50],
      Colors.pink[50],
    ];
    final carpa = [
      ColumStack(
          brandName: TextConstant.brandNameAdidas,
          modelName: TextConstant.modelNameAdidas,
          imagename: ImageConstant.adidasImage,
          giveColors: colors[0]),
      ColumStack(
          brandName: TextConstant.newbalanceBrandname,
          modelName: TextConstant.newbalanceModelName,
          imagename: ImageConstant.newbalanceImge,
          giveColors: colors[1]),
      ColumStack(
          brandName: TextConstant.pumaBrandName,
          modelName: TextConstant.pumaModelName,
          imagename: ImageConstant.pumaImage,
          giveColors: colors[2]),
      ColumStack(
          brandName: TextConstant.nikeBrandName,
          modelName: TextConstant.nikeModelName,
          imagename: ImageConstant.nikeImage,
          giveColors: colors[2]),
    ];

    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: textAoboshiOne(
                      text: TextConstant.homeTitle1,
                      fontSizes: 25,
                      colors: textColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: textAoboshiOne(
                      text: TextConstant.homeTitle2,
                      fontSizes: 15,
                      colors: textColor,
                    ),
                  ),
                  const Gap(25),
                  CarouselSlider(
                    items: containerForCarosilForHome.map((cont) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Builder(
                          builder: (context) {
                            return cont;
                          },
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 180,
                      viewportFraction: 1,
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        textAoboshiOne2(
                          text: TextConstant.earnMoney,
                          fontSizes: 20,
                          colors: textColor,
                          fontw: FontWeight.bold,
                        ),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: bagroundColorOFscreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side: BorderSide(color: mainBlueColor)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const SellProdect(),
                                ),
                              );
                            },
                            child: textAoboshiOne2(
                                text: "Sell",
                                fontSizes: 20,
                                colors: mainBlueColor,
                                fontw: FontWeight.bold))
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        textAoboshiOne2(
                          text: TextConstant.latestShoes,
                          fontSizes: 25,
                          colors: textColor,
                          fontw: FontWeight.bold,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (ctx) => bo(),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: [
                              textAoboshiOne2(
                                text: TextConstant.showALl,
                                fontSizes: 15,
                                colors: textColor,
                                fontw: FontWeight.bold,
                              ),
                              const Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  CarouselSlider(
                    items: carpa.map((ele) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Builder(
                          builder: (context) {
                            return ele;
                          },
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: false,
                      height: 300,
                      viewportFraction: 0.5,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: benificContainerRow(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column ColumStack(
      {required String imagename,
      required Color giveColors,
      required String brandName,
      required String modelName}) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 220,
          child: Card(
            elevation: 5,
            color: giveColors,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 20,
                  child: textAoboshiOne2(
                      text: brandName,
                      fontSizes: 13,
                      colors: textColor,
                      fontw: FontWeight.bold),
                ),
                Positioned(
                  top: 45,
                  left: 20,
                  child: textAoboshiOne2(
                      text: modelName,
                      fontSizes: 18,
                      colors: textColor,
                      fontw: FontWeight.w800),
                ),
                const Positioned(
                  top: 70,
                  left: 20,
                  child: Icon(Icons.arrow_right_alt),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage(imagename),
                    height: 100,
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

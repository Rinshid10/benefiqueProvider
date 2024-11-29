import 'package:benefique/controller/cartFunction.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Whislit extends StatelessWidget {
  const Whislit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        backgroundColor: bagroundColorOFscreen,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: textAoboshiOne2(
            text: 'Wishlist',
            fontSizes: 20,
            colors: Colors.black,
            fontw: FontWeight.w900),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("List"),
              Gap(10),
              Row(
                children: [
                  Text("Your list and registries"),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: mainBlueColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: List.generate(5, (index) {
                  return Expanded(
                      child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: CircleBorder(),
                    child: Consumer<CartFunction>(
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Image(
                                image:
                                    AssetImage(value.imagefoWhislist[index])),
                            radius: 40,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ));
                }),
              ),
              Text('See All'),
              Gap(5),
              Divider(),
              Row(
                children: [
                  Text('All Save'),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 120,
                    child: Center(child: Text('Filter & Sort')),
                    decoration: BoxDecoration(
                        border: Border.all(color: mainBlueColor),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              Gap(15),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Consumer<ProdectDetails>(
                    builder: (context, value, child) => Container(
                      height: 120,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          color: value.colors[index % value.colors.length],
                          elevation: 2,
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 120,
                                  child: Image(
                                    image: AssetImage(
                                      'asset/wish-removebg-preview.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Gap(20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Gap(2),
                                    textAoboshiOne2(
                                        text: 'RInshid',
                                        fontSizes: 19,
                                        colors: Colors.black,
                                        fontw: FontWeight.normal),
                                    textAoboshiOne2(
                                        text: 'Price : 12345',
                                        fontSizes: 13,
                                        colors: Colors.black,
                                        fontw: FontWeight.normal),
                                    Gap(10),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            textAoboshiOne2(
                                                text: "Add To Cart",
                                                fontSizes: 12,
                                                colors: Colors.black,
                                                fontw: FontWeight.normal),
                                            Gap(2),
                                            Icon(
                                              CupertinoIcons.cart,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.heart_broken),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget containers() {
  return Container(
    child: Stack(children: [
      Positioned(
        bottom: 0,
        left: 90,
        child: textAoboshiOne2(
            text: "Your wishlist is empty!",
            fontSizes: 20,
            colors: Colors.black,
            fontw: FontWeight.w900),
      ),
      Image(image: AssetImage('asset/wish-removebg-preview.png'))
    ]),
  );
}

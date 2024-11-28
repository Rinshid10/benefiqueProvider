import 'dart:io';
import 'package:benefique/view/ordernimation.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class ViewProdect extends StatefulWidget {
  String? titleName;
  String? discount;
  String? price;
  String? brand;
  File imagepath;
  String? catacore;

  ViewProdect(
      {super.key,
      required this.titleName,
      required this.discount,
      required this.imagepath,
      required this.brand,
      required this.catacore,
      required this.price});

  @override
  State<ViewProdect> createState() => _ViewProdectState();
}

class _ViewProdectState extends State<ViewProdect> {
  final sizeOfShoes = [
    '5',
    '6',
    '7',
    '8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1F5F8),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Iconsax.heart5,
              color: Colors.pink,
              size: 30,
            ),
          )
        ],
      ),
      backgroundColor: mainBlueColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                child: Image.file(
                  widget.imagepath,
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: bagroundColorOFscreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(25),
                    textAoboshiOne2(
                        fontw: FontWeight.bold,
                        text: '${widget.titleName}',
                        fontSizes: 25,
                        colors: Colors.black87),
                    textAoboshiOne2(
                        fontw: FontWeight.normal,
                        text: 'Mens shoes',
                        fontSizes: 13,
                        colors: Colors.black87),
                    Gap(5),
                    Row(
                      children: [
                        textAoboshiOne2(
                            fontw: FontWeight.bold,
                            text: '${widget.discount}%',
                            fontSizes: 20,
                            colors: Colors.red),
                        Gap(10),
                        textAoboshiOne2(
                            fontw: FontWeight.w800,
                            text: '₹${widget.price}',
                            fontSizes: 20,
                            colors: Colors.black),
                        Gap(10),
                      ],
                    ),
                    Gap(5),
                    textAoboshiOne2(
                        text: 'Details',
                        fontSizes: 18,
                        colors: Colors.black,
                        fontw: FontWeight.bold),
                    textAoboshiOne2(
                        text:
                            'The was first introduced in 1984 as a high-performance basketball shoe. It quickly gained popularity not only on the courts but also as a streetwear staple.',
                        fontSizes: 12,
                        colors: Colors.black,
                        fontw: FontWeight.normal),
                    Gap(10),
                    textAoboshiOne2(
                        text: 'Available size:',
                        fontSizes: 20,
                        colors: Colors.black,
                        fontw: FontWeight.bold),
                    Gap(10),
                    SizedBox(
                      height: 80,
                      // color: mainBlueColor,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.9,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                              backgroundColor: mainBlueColor,
                              radius: 15,
                              child: textAoboshiOne2(
                                  text: sizeOfShoes[index],
                                  fontSizes: 20,
                                  colors: Colors.white,
                                  fontw: FontWeight.bold));
                        },
                      ),
                    ),
                    textAoboshiOne2(
                        text: 'Reviews',
                        fontSizes: 20,
                        colors: Colors.black,
                        fontw: FontWeight.bold),
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: mainBlueColor,
                            radius: 15,
                            child: Icon(
                              Icons.reviews,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                          positionInCircleAvathar(posi: 20),
                          positionInCircleAvathar(posi: 35),
                          Positioned(
                              left: 65,
                              child: textAoboshiOne2(
                                  text: '+1',
                                  fontSizes: 15,
                                  colors: mainBlueColor,
                                  fontw: FontWeight.w900)),
                        ],
                      ),
                    ),
                    Gap(30),
                    Row(
                      children: [
                        SizedBox(
                            height: 55,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: 70,
                                                child: Image(
                                                    image: AssetImage(
                                                        'asset/Animation - 1731644344351.gif')),
                                              ),
                                              Gap(10),
                                              textAoboshiOne2(
                                                  text: 'Added to cart',
                                                  fontSizes: 18,
                                                  colors: Colors.black,
                                                  fontw: FontWeight.bold)
                                            ],
                                          )));
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: mainBlueColor),
                                child: Icon(
                                  Iconsax.shopping_cart5,
                                  color: Colors.white,
                                ))),
                        Gap(10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                                height: 55,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 15,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: mainBlueColor),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  OrderAnimation()));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        textAoboshiOne2(
                                            text: 'Buy now',
                                            fontSizes: 20,
                                            colors: Colors.white,
                                            fontw: FontWeight.bold),
                                        Gap(10),
                                        Icon(
                                          Iconsax.shopping_cart5,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Positioned positionInCircleAvathar({required double posi}) {
    return Positioned(
      left: posi,
      child: CircleAvatar(
        backgroundColor: mainBlueColor,
        radius: 15,
        child: Icon(
          Icons.reviews,
          color: Colors.white,
          size: 10,
        ),
      ),
    );
  }

//................................................................

  SizedBox containerColor({required Color colorName}) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Card(
        color: colorName,
      ),
    );
  }
}

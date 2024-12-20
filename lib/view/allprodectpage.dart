// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/cartFunction.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/controller/profileFunctions.dart';
import 'package:benefique/controller/whislist.dart';

import 'package:benefique/modal/prodectModal/prodectModal.dart';

import 'package:benefique/view/cart.dart';
import 'package:benefique/view/viewProdect.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:benefique/view/wishlist/whislit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import 'package:provider/provider.dart';

var cartindex = 0;

dynamic colorForWhishList = Colors.grey;

class AllprodectPage extends StatefulWidget {
  const AllprodectPage({super.key});

  @override
  State<AllprodectPage> createState() => _AllprodectPageState();
}

class _AllprodectPageState extends State<AllprodectPage> {
  TextEditingController searchController = TextEditingController();
  String search = '';
  List<Prodectmodel> searchResult = [];
  var cartChange = 'Add to Cart';

  @override
  void initState() {
    super.initState();
    Provider.of<ProdectDetails>(context, listen: false)
        .getAllProdect()
        .then((_) {
      Provider.of<ProdectDetails>(context, listen: false)
          .filteredListOfProduct('All');
      searchListUpdate();
    });
    searchListUpdate();
  }

  void searchListUpdate() {
    var serchget =
        Provider.of<ProdectDetails>(context, listen: false).getFilterDetails;
    setState(() {
      if (search.isEmpty) {
        searchResult = serchget;
      } else {
        searchResult = serchget
            .where((product) =>
                product.itemname!.toLowerCase().contains(search.toLowerCase()))
            .toList();
      }
    });
  }

  int currentIndex = 0;

  final shoesForAllCategories = [
    'All',
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike'
  ];

  @override
  Widget build(BuildContext context) {
    int a = Provider.of<CartFunction>(context).getForStore.length;
    int b = Provider.of<WhislistProvider>(context).getForWishlist.length;
    Provider.of<ProdectDetails>(context, listen: false).getAllProdect();

    final prodectDetailsGEt =
        Provider.of<ProdectDetails>(context, listen: false).getProdectDetals;
    final filterlsit =
        Provider.of<ProdectDetails>(context, listen: false).getFilterDetails;
    final forProfile = Provider.of<Profilefunction>(
      context,
    );

    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        // title: Row(
        //   children: [
        //     textAoboshiOne2(
        //         text: "Hey ",
        //         fontSizes: 20,
        //         colors: Colors.black,
        //         fontw: FontWeight.w800),
        //     textAoboshiOne2(
        //         text: forProfile.getProfileDetils.first.username.toString(),
        //         fontSizes: 18,
        //         colors: mainBlueColor,
        //         fontw: FontWeight.bold),
        //   ],
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: bagroundColorOFscreen,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                b == 0
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Whislit()));
                        },
                        child: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 28,
                        ),
                      )
                    : Badge(
                        label: Text(Provider.of<WhislistProvider>(
                          context,
                        ).getForWishlist.length.toString()),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (ctx) => Whislit()),
                              );
                            },
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 28,
                            )),
                      ),
                const Gap(15),
                a == 0
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => CartPage()),
                          );
                        },
                        child: Icon(
                          CupertinoIcons.cart,
                          size: 28,
                        ),
                      )
                    : Badge(
                        label: Text(a.toString()),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => CartPage(),
                                ),
                              );
                            },
                            child: Icon(
                              CupertinoIcons.cart,
                              size: 28,
                            )),
                      ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        search = value;
                        searchListUpdate();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: TextConstant.searchHint,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: const Icon(Iconsax.search_normal_1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 50,
                    width: 60,
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 25,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: mainBlueColor,
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoesForAllCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        (shoesForAllCategories[index]);
                        searchListUpdate();
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentIndex == index
                              ? Colors.blue
                              : Colors.black45,
                        ),
                        color: currentIndex == index
                            ? mainBlueColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          shoesForAllCategories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(15),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 200,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: GridForAllProdect(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget GridForAllProdect() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Consumer<ProdectDetails>(
      builder: (context, prodectValues, child) {
        final prodectGett = prodectValues.getProdectDetals;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
          ),
          itemBuilder: (context, index) {
            final getDatass = prodectGett[index];
            return GestureDetector(
              onLongPress: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ViewProdect(
                      catacore: getDatass.category,
                      imagepath: File(getDatass.images ?? ''),
                      titleName: getDatass.itemname,
                      discount: getDatass.discound,
                      price: getDatass.yourPrice,
                      brand: getDatass.modal,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Card(
                    elevation: 3,
                    color: bagroundColorOFscreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 165,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image:
                                        FileImage(File(getDatass.images ?? '')),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 10,
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Consumer<WhislistProvider>(
                                      builder: (context, value, child) {
                                    return IconButton(
                                        onPressed: () {
                                          Provider.of<WhislistProvider>(context,
                                                  listen: false)
                                              .change(getDatass);
                                        },
                                        icon: Icon(
                                          prodectGett[index].isWhislist
                                              ? Iconsax.heart5
                                              : CupertinoIcons.heart,
                                          size: 30,
                                          color: Colors.red,
                                        ));
                                  })),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: textAoboshiOne2(
                            text: getDatass.itemname.toString(),
                            fontSizes: 17,
                            colors: Colors.black87,
                            fontw: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              textAoboshiOne2(
                                text: TextConstant.price,
                                fontSizes: 17,
                                colors: const Color.fromARGB(255, 94, 94, 94),
                                fontw: FontWeight.bold,
                              ),
                              const Spacer(),
                              textAoboshiOne2(
                                text: '₹${getDatass.yourPrice.toString()}',
                                fontSizes: 17,
                                colors: Colors.black87,
                                fontw: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Consumer<CartFunction>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.black26),
                                ),
                                backgroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              onPressed: () {
                                final valuess = prodectGett[index];

                                Provider.of<CartFunction>(context,
                                        listen: false)
                                    .change(valuess);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        duration: Duration(milliseconds: 300),
                                        backgroundColor: bagroundColorOFscreen,
                                        content: Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 60,
                                              child: Image(
                                                  image: AssetImage(ImageConstant
                                                      .cartAnimationNotifyer)),
                                            ),
                                            Gap(30),
                                            textAoboshiOne2(
                                                text: TextConstant.addedtoCart,
                                                fontSizes: 18,
                                                colors: Colors.black,
                                                fontw: FontWeight.bold)
                                          ],
                                        )));
                              },
                              child: prodectGett[index].isInCart
                                  ? Text('Added To cart')
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Add to Cart',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Gap(5),
                                        Icon(
                                          Icons.shopping_cart_checkout,
                                          size: 20,
                                          color: Colors.black,
                                        )
                                      ],
                                    ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: prodectGett.length,
        );
      },
    ),
  );
}

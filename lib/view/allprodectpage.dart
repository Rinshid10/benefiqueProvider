// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/cartFunction.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/view/cart.dart';
import 'package:benefique/view/viewProdect.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

var cartindex = 0;
bool cartTrue = false;
bool wishList = false;
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
    Provider.of<prodectDetails>(context, listen: false)
        .getAllProdect()
        .then((_) {
      // ignore: use_build_context_synchronously
      Provider.of<prodectDetails>(context, listen: false)
          .filteredListOfProduct('All');
      searchListUpdate();
    });
    searchListUpdate();
  }

  void searchListUpdate() {
    var serchget =
        Provider.of<prodectDetails>(context, listen: false).getFilterDetails;
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
    final prodectDetailsGEt =
        Provider.of<prodectDetails>(context, listen: false).getProdectDetals;
    final filterlsit =
        Provider.of<prodectDetails>(context, listen: false).getFilterDetails;

    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bagroundColorOFscreen,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const Icon(Iconsax.heart5),
                const Gap(20),
                Badge(
                  label: Text(cartindex.toString()),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => CartPage(
                              cartItemsOfEach: prodectDetailsGEt,
                            ),
                          ),
                        );
                      },
                      child: Icon(Iconsax.shopping_cart)),
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
            Container(
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
                              ? Colors.black
                              : Colors.black45,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          shoesForAllCategories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            color: currentIndex == index
                                ? Colors.black
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
    child: Consumer<prodectDetails>(
      builder: (context, value, child) {
        final prodectGett = value.getProdectDetals;
        final changeCartname = value.addTocartChange;
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
                              right: 10,
                              top: 10,
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Iconsax.heart5,
                                          size: 30, color: colorForWhishList))),
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
                      child: Consumer<prodectDetails>(
                        builder: (context, value, child) {
                          final getaall = value.getProdectDetals;
                        
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
                              final valuess = getaall[index];
                              // Provider.of<cartFunction>(context, listen: false)
                              //     .saveCartItem(getDatass);
                                  
                                
                              // value.changeCartname(index);
                              

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
                            child: Text(
                              changeCartname.toString(),
                              style: TextStyle(color: Colors.red),
                            ),
                          );
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

import 'dart:io';
import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SellProdect extends StatefulWidget {
  const SellProdect({super.key});

  @override
  State<SellProdect> createState() => _SellProdectState();
}

class _SellProdectState extends State<SellProdect> {
  final itemBrand = TextEditingController();
  final itemName = TextEditingController();
  final yourPrice = TextEditingController();
  final currentPrice = TextEditingController();
  final discout = TextEditingController();
  final contry = TextEditingController();
  final state = TextEditingController();
  File? imageSelect;
  final List<String> choseThebrand = [
    'All',
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike'
  ];
  List<String> districtsOfKerala = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];

  String? selectedBrand;
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: mainBlueColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          TextConstant.titile,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImageGallery();
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: imageSelect != null
                        ? FileImage(imageSelect!)
                        : AssetImage(
                            ImageConstant.circleImge,
                          ) as ImageProvider,
                  ),
                ),
                Gap(10),
              ],
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: const [
                  Text(
                    TextConstant.towOrmore,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Gap(15),
                  Icon(Iconsax.truck_fast),
                ],
              ),
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            Gap(20),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: EdgeInsets.only(left: 10),
                          hint: Text(TextConstant.barndSelect),
                          value: selectedBrand,
                          items: choseThebrand
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBrand = value;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  TextFormField(
                    controller: itemName,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: TextConstant.nameSelect,

                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Gap(25),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: yourPrice,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.yourPrice,

                              // contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.dollar_circle),
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: currentPrice,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.hintText,

                              // contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.dollar_circle),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(15),
                  Row(
                    children: [
                      SizedBox(
                        height: 55,
                        width: 130,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: discout,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: TextConstant.discount,

                            // contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Icon(Iconsax.discount_circle),
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            controller: contry,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.hintText1,

                              // contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(15),
                  TextFormField(
                    controller: contry,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: EdgeInsets.only(left: 10),
                          hint: Text(TextConstant.district),
                          value: selectedState,
                          items: districtsOfKerala
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: mainBlueColor,
                    minimumSize: Size(150, 50)),
                onPressed: () {
                  addProduct();
                },
                child: Text(
                  'Sell',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  Row rowForImage({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        Gap(10),
        Icon(
          Iconsax.gallery_add,
          color: Colors.black54,
        )
      ],
    );
  }

  Future addProduct() async {
    final brand = itemBrand.text;
    final item = itemName.text;
    final yourPice = yourPrice.text;
    final curruntPrice = currentPrice.text;
    final discount = discout.text;
    final contrys = contry.text;
    final statesss = state.text;
    final category = selectedBrand;
    if (item.isNotEmpty &&
        yourPice.isNotEmpty &&
        curruntPrice.isNotEmpty &&
        imageSelect != null) {
      final saveAll = Prodectmodel(
          modal: brand,
          itemname: item,
          yourPrice: yourPice,
          currentPrice: curruntPrice,
          discound: discount,
          country: contrys,
          state: statesss,
          category: category,
          images: imageSelect?.path ?? "");
      Provider.of<prodectDetails>(context, listen: false)
          .addProdectTolist(saveAll);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text(TextConstant.fillthe)));
    }
  }

  Future<void> pickImageGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      setState(() {
        imageSelect = File(pickedFile.path);
      });
    }
  }
}

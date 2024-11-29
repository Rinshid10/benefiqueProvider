import 'dart:io';

import 'package:benefique/constants/image_constant.dart';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/view/bottomNavigation/bt.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  String? nameOfItem;
  String? yourPrice;
  String? currentPrice;
  String? discount;
  String? country;
  String? selectedBrand;
  String? state;
  File? images;
  int index;

  EditPage(
      {super.key,
      required this.nameOfItem,
      required this.yourPrice,
      required this.currentPrice,
      required this.discount,
      required this.country,
      this.selectedBrand,
      required this.index,
      required this.images,
      this.state});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController itemBrand;
  late TextEditingController itemName;
  late TextEditingController yourPriceController;
  late TextEditingController currentPriceController;
  late TextEditingController discountController;
  late TextEditingController countryController;
  late TextEditingController stateController;
  File? imageSelect;

  final List<String> choseTheBrand = [
    'Adidas',
    'Converse',
    'New Balance',
    'Puma',
    'Nike',
    'Other',
  ];
  final List<String> districtsOfKerala = [
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
  void initState() {
    super.initState();
    itemBrand = TextEditingController(text: widget.selectedBrand);
    itemName = TextEditingController(text: widget.nameOfItem);
    yourPriceController = TextEditingController(text: widget.yourPrice);
    currentPriceController = TextEditingController(text: widget.currentPrice);
    discountController = TextEditingController(text: widget.discount);
    countryController = TextEditingController(text: widget.country);
    stateController = TextEditingController(text: widget.state);
    selectedBrand = widget.selectedBrand;
    selectedState = widget.state;
    imageSelect = widget.images;
  }

  @override
  void dispose() {
    itemBrand.dispose();
    itemName.dispose();
    yourPriceController.dispose();
    currentPriceController.dispose();
    discountController.dispose();
    countryController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bagroundColorOFscreen,
      appBar: AppBar(
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
          TextConstant.editProdectForeditpage,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImageGallery();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: imageSelect != null
                          ? FileImage(imageSelect!)
                          : const AssetImage(ImageConstant.editpageCircle)
                              as ImageProvider,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    TextConstant.addMoreimage,
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
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: itemBrand,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color(0xffd9d9d9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: const EdgeInsets.only(left: 10),
                          hint: const Text(TextConstant.choosethebrand),
                          value: selectedBrand,
                          items: choseTheBrand
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBrand = value;
                              itemBrand.text = value!;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: itemName,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: TextConstant.hintTexNameofitem,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const Gap(25),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: yourPriceController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.hintTextYourprice,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.dollar_circle),
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: currentPriceController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.hintTextCurrentprice,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.dollar_circle),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      SizedBox(
                        height: 55,
                        width: 130,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: discountController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: TextConstant.hintTextDiscount,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Icon(Iconsax.discount_circle),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            controller: countryController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: TextConstant.hintTextContry,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: stateController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      fillColor: const Color(0xffd9d9d9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: const EdgeInsets.only(left: 10),
                          hint: const Text(TextConstant.selectState),
                          value: selectedState,
                          items: districtsOfKerala
                              .map<DropdownMenuItem<String>>((String ele) {
                            return DropdownMenuItem(
                                value: ele, child: Text(ele));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                              stateController.text = value!;
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: mainBlueColor,
                    minimumSize: const Size(150, 50)),
                onPressed: () {
                  addProduct();
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  Future addProduct() async {
    final brand = itemBrand.text;
    final item = itemName.text;
    final yourPice = yourPriceController.text;
    final curruntPrice = currentPriceController.text;
    final discount = discountController.text;
    final contrys = countryController.text;
    final statesss = stateController.text;
    final category = selectedBrand;
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
    Provider.of<ProdectDetails>(context, listen: false)
        .editingProdect(widget.index, saveAll);

    
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => Navigationpage()));
  }

  Future<void> pickImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageSelect = File(pickedFile.path);
      }
    });
  }
}

import 'dart:io';
import 'package:benefique/constants/text_constant.dart';
import 'package:benefique/controller/prodectModel.dart';
import 'package:benefique/view/editPage.dart';
import 'package:benefique/view/widgets/widgetAndColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMain extends StatefulWidget {
  const EditMain({super.key});

  @override
  State<EditMain> createState() => _EditMainState();
}

class _EditMainState extends State<EditMain> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProdectDetails>(context, listen: false).getAllProdect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainBlueColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            TextConstant.editProdect,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<ProdectDetails>(
          builder: (context, value, child) {
            final getall = value.getProdectDetals;
            return ListView.builder(
              itemCount: getall.length,
              itemBuilder: (context, index) {
                final editData = getall[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 100,
                    child: Card(
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => EditPage(
                                  images: File(editData.images ?? ''),
                                  country: editData.country,
                                  currentPrice: editData.currentPrice,
                                  discount: editData.discound,
                                  index: index,
                                  nameOfItem: editData.itemname,
                                  yourPrice: editData.yourPrice,
                                ),
                              ),
                            );
                          },
                          leading: SizedBox(
                            height: double.infinity,
                            width: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: editData.images != null &&
                                      File(editData.images!).existsSync()
                                  ? Image.file(
                                      File(editData.images!),
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(Icons.image_not_supported),
                            ),
                          ),
                          title: Text(editData.itemname.toString()),
                          subtitle: Text(
                              'Your Price: ${editData.yourPrice.toString()}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

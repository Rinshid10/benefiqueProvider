import 'package:benefique/view/profilPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

var mainBlueColor = Colors.blue;
//  Color(0xff514eb5)
//  Color(0xff1a434e)
var textColor = Colors.black;
// Color(0xff4B0082)
// Colors.blue
// Colors.blueGrey;
//  const Color(0xff001C57);
var bagroundColorOFscreen = Color(0xfffdfdfd);
// const Color(0xffEEEEEE);
// blueGrey
var textFeildColor = const Color(0xffd9d9d9);

//login screeen................................................................
var keybordType = TextInputType.number;
Widget textFeilds({
  required String name,
  required IconData iconName,
  required String controllName,
  TextInputType? keybordtype,
  TextEditingController? controller,
}) {
  return TextFormField(
    keyboardType: keybordtype,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      hintText: name,
      filled: true,
      fillColor: const Color(0xffd9d9d9),
      // contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      suffixIcon: Icon(iconName),
    ),
  );
}

// HomePage..........................................................................

Widget benificContainerRow() {
  return Container(
      color: bagroundColorOFscreen,
      height: 50,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20),
              height: 100,
              width: 100,
              child: Image(
                  image: AssetImage('asset/Benfiqe-removebg-preview.png'))),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: mainBlueColor,
              child: Center(
                child: textAoboshiOne2(
                    text: 'R',
                    fontSizes: 20,
                    colors: Colors.white,
                    fontw: FontWeight.bold),
              ),
            ),
          ),
          Gap(15)
        ],
      ));
}

// Widget textfeildContainer() {
//   return Container(
//     margin: EdgeInsets.only(left: 30, right: 30),
//     child: TextFormField(
//       decoration: InputDecoration(
//           prefixIcon: Icon(Icons.menu),
//           fillColor: Colors.white,
//           filled: true,
//           suffixIcon: Icon(
//             Icons.search,
//             size: 30,
//           ),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: bagroundColorOFscreen),
//               borderRadius: BorderRadius.circular(10)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: bagroundColorOFscreen),
//               borderRadius: BorderRadius.circular(10))),
//     ),
//   );
// }
// home page ......................................

final containerForCarosilForHome = [
  whitStakeForContainer(
      name: '',
      brandName: 'NIKE AIR',
      itemName: 'JORDAN',
      price: 'Only at :  ₹ 5.999',
      imagepath: 'asset/Main-removebg-preview.png'),
  SizedBox(
    height: 350,
    child: Stack(
      children: [
        Card(
            elevation: 5,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('asset/aCampus_Intro.png'))),
        Positioned(
          top: 10,
          left: 20,
          child: textAoboshiOne2(
              text: 'Adidas Campus',
              fontSizes: 25,
              colors: Colors.white,
              fontw: FontWeight.w800),
        )
      ],
    ),
  ),
];

Widget whitStakeForContainer({
  required String name,
  required String brandName,
  required String itemName,
  required String price,
  required String imagepath,
}) {
  return Card(
    color: Colors.green[100],
    elevation: 3,
    child: Stack(
      children: [
        // Container(
        //   height: 200,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: bagroundColorOFscreen,
        //   ),
        // ),
        Positioned(
          top: 1,
          right: -20,
          child: Align(
            alignment: Alignment.topRight,
            child: Image(height: 200, image: AssetImage(imagepath)),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'New Relese',
              style: TextStyle(
                  shadows: const [
                    Shadow(
                      offset: Offset(2, 0),
                    )
                  ],
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Gap(3),
            Text(
              brandName,
              style: TextStyle(
                  shadows: const [
                    Shadow(
                      offset: Offset(2, 0),
                    )
                  ],
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              itemName,
              style: TextStyle(
                  shadows: const [
                    Shadow(
                      offset: Offset(2, 0),
                    )
                  ],
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
          ]),
        ),
        Positioned(
          top: 120,
          left: 25,
          child: Text(
            price,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
// Cart ......................................................

Widget priceOfCart({
  required String name,
  required String price,
}) {
  return Container(
    margin: EdgeInsets.only(left: 50, right: 10),
    child: Row(
      children: [
        textAoboshiOne2(
            text: name,
            fontSizes: 20,
            colors: Colors.black87,
            fontw: FontWeight.bold),
        Spacer(),
        textAoboshiOne2(
            text: '₹$price',
            fontSizes: 20,
            colors: Colors.black87,
            fontw: FontWeight.normal),
      ],
    ),
  );
}

//  allProdect ................................................................

// comen...............................................................

Widget textAoboshiOne(
    {required String text, required double fontSizes, required Color colors}) {
  return Text(text,
      style: TextStyle(
          color: colors, fontSize: fontSizes, fontWeight: FontWeight.bold));
}

Widget textAoboshiOne2(
    {required String text,
    required double fontSizes,
    required Color colors,
    required FontWeight fontw}) {
  return Text(text,
      maxLines: 3,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: colors,
          fontSize: fontSizes,
          fontWeight: fontw));
}

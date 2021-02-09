import 'package:flutter/material.dart';
import 'package:hakki_tasarim/const.dart';
import 'package:hakki_tasarim/lists.dart';

class Notes_Page extends StatefulWidget {
  @override
  _Notes_PageState createState() => _Notes_PageState();
}

class _Notes_PageState extends State<Notes_Page> {
  Size size;
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(size),
              SizedBox(
                height: 20,
              ),
              Container(height: 200.0 * notlar.length, child: buildList(size)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(Size size) {
    return Container(
      height: 200,
      color: categoriesColor[0],
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "General",
              style: headerStyle6,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "2 notes",
              style: headerStyle7,
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(Size size) {
    return ListView.builder(
        itemCount: notlar.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 130,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: borderRadis1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 110,
                      width: size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${notlarBaslik[index]}",
                            style: headerStyle5,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${notlar[index]}",
                            style: headerStyle4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(176, 140, 249, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';

import '../../const.dart';
import '../../lists.dart';


class HomePage extends StatelessWidget {
  var size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            header(size),
            categoriesAndNew(),
            buildCategories(size),
            buildRecentOnesAndFilterHeader(size),
            SizedBox(
              height: 10,
            ),
            Container(
                height: notlar.length * 150.0,
                width: 300,
                child: buildLastNotes(size)),
          ],
        ),
      ),
    );
  }

  Widget header(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Home", style: headerStyle),
          Icon(
            Icons.settings,
            color: Colors.grey.shade800,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget categoriesAndNew() {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: headerStyle2,
            ),
            Text(
              "+New",
              style: headerStyle3,
            ),
          ],
        ),
      ),
    );
  }


  Widget buildCategories(Size size) {
    return Container(
      height: 130,
      width: size.width,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: borderRadis1, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: categoriesColor[index]),
                      ),
                      Text(
                        "${categories[index]}",
                        style: headerStyle4,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildRecentOnesAndFilterHeader(Size size) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Notes",
              style: headerStyle2,
            ),
            Row(
              children: [
                Text(
                  "+New",
                  style: headerStyle3,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.filter_alt)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildLastNotes(Size size) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
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
                        Row(
                          children: [
                            Text(
                              "${notlarBaslik[index]}",
                              style: headerStyle5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              dates[index].toString(),
                              style: headerStyle3_2,
                            )
                          ],
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
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: categoriesColor[index]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}

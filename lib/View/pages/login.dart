import 'package:flutter/material.dart';

import '../../const.dart';



class LoginPage extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              builHeader(),
              buildTextForm(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextForm(Size size) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3)),
          ]),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: TextFormField(
              style: headerStyle4,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: generalColor,
                ),
              ),
            ),
          ),
          buildSave()
        ],
      )),
    );
  }

  builHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text("Enter your password", style: headerStyle3),
    );
  }

  buildSave() {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0, top: 30, left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                "Reset",
                style: headerStyle11,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                "Enter",
                style: headerStyle11,
              ),
            ),
          )
        ],
      ),
    );
  }
}

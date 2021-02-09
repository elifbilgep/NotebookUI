import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hakki_tasarim/const.dart';
import 'package:hakki_tasarim/lists.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  Size size;
  String dropdownValue = categories[0];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              elevation: 5,
              child: Icon(
                Icons.save,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: scaffoldColor,
          body: Column(
            children: [
              buildAppBar(size),
              buildTitleFormField(size),
              buildFormField(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(Size size) {
    return Container(
      height: 50,
      width: size.width,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.close_outlined,
              size: 40,
              color: Colors.grey.shade400,
            ),
          ),
          dropDown(),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      iconSize: 30,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: categories.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: headerStyle3,
          ),
        );
      }).toList(),
    );
  }

  Widget buildTitleFormField(Size size) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 5),
        child: TextFormField(
          style: headerStyle5,
          autofocus: true,
          cursorColor: Colors.grey.shade600,
          decoration: new InputDecoration(
            hintText: "Title",
            hintStyle: headerStyle5,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  buildFormField(Size size) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            TextFormField(
              style: headerStyle10,
              cursorHeight: 20,
              cursorColor: Colors.grey.shade800,
              decoration: new InputDecoration(
                hintText: "Note",
                hintStyle: headerStyle10,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              maxLines: 20,
            )
          ],
        ),
      ),
    );
  }
}

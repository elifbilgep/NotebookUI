import 'package:flutter/material.dart';
import 'package:hakki_tasarim/const.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Size size;
  String dropdownValue = 'English';
  List<String> diller = ["English", "Türkçe"];
  List<String> bos = [""];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldColor,
        body: Column(
          children: [
            buildHeader(size),
            SizedBox(
              height: 20,
            ),
            dropDownButtonsColumn(diller),
            changePassword(bos, "Change Your Password", size),
            saveButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(Size size) {
    return Container(
      height: 220,
      width: size.width,
      color: Colors.grey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Settings",
              style: headerStyle6,
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownButtonsColumn(List<String> list) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.grey.shade400),
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade400,
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconEnabledColor: Colors.grey.shade400,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: headerStyle7,
                    ),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                hint: Text(
                  "$dropdownValue",
                  style: headerStyle8,
                ),
                value: dropdownValue,
              ),
            )),
      ),
    );
  }

  Widget changePassword(List<String> list, String hint, Size size) {
    var bankSelected;
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.grey.shade400),
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade400,
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconEnabledColor: Colors.grey.shade400,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      height: 200,
                      width: size.width - 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Change Password",
                            style: headerStyle3,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(child: buildForm())
                        ],
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  hint,
                  style: headerStyle7,
                ),
                onChanged: (String value) {
                  setState(() {
                    bankSelected = value;
                  });
                },
                value: bankSelected,
              ),
            )),
      ),
    );
  }

  Widget buildForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: "Password",
          ),
          onSaved: (String value) {},
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              color: Colors.grey.shade800,
              onPressed: () {},
              child: Text(
                "Save",
                style: headerStyle7,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Cancel",
                style: headerStyle4,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.black),
            height: 50,
            width: 50,
            child: Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  final User user;
  final Function updateUserData;
  ProfileEdit(this.user, this.updateUserData);
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String _inputUserName = user.userName;
  String _inputUserRole = user.userRole;
  DateTime _inputDOB = user.userDOB;

  void _datePickerHandler() {
    (showDatePicker(
      context: context,
      initialDate: user.userDOB,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _inputDOB = value;
      });
    }));
  }

  void _updateHandler() {
    if ((_inputUserName).trim() != "" && (_inputUserRole).trim() != "") {
      widget.updateUserData(
        _inputUserName,
        _inputUserRole,
        _inputDOB,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 2,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text("Name"),
            ),
            controller: null,
            initialValue: widget.user.userName,
            onChanged: (value) {
              setState(() {
                _inputUserName = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text("Role"),
            ),
            controller: null,
            initialValue: widget.user.userRole,
            onChanged: (value) {
              setState(() {
                _inputUserRole = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "DOB: ${DateFormat.yMd().format(_inputDOB)}",
                ),
              ),
              TextButton(
                onPressed: _datePickerHandler,
                child: Text("Change DOB"),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: _updateHandler,
              child: Text("Update"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

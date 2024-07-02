import 'dart:io';
import 'dart:typed_data';

import 'package:apitest/data_model.dart';
import 'package:apitest/qr_code_screen.dart';
import 'package:flutter/material.dart';

class DisplayDataScreen extends StatefulWidget {
  DisplayDataScreen({super.key, this.userData, this.profile});

  UserData? userData;
  Uint8List? profile;

  @override
  State<DisplayDataScreen> createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const QRCodeScanScreen(),),
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.memory(widget.profile!,fit: BoxFit.fill,),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.userData?.firstName} ${widget.userData?.lastName}"),
            Text("${widget.userData?.email}"),
          ],
        ),
        Text("Gender: ${widget.userData?.gender}"),
        Text("DOB: ${widget.userData?.dob}"),
        Text("Contact: ${widget.userData?.contactNumber}"),
      ],
    );
  }
}

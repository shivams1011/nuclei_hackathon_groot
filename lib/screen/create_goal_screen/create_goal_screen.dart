import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuclei_hackathon_groot/screen/goal_overview_screen/goal_overview_screen.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';

class CreateGoalScreen extends StatefulWidget {
  CreateGoalScreen({Key key}) : super(key: key);

  @override
  _CreateGoalScreenState createState() => _CreateGoalScreenState();
}

class _CreateGoalScreenState extends State<CreateGoalScreen> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        backgroundColor: Color(ColorsUtil.appBgColor),
        elevation: 0,
        title: Text(
          'Create your Goal',
          style: FontUtil.setTextStyle(fontSize: 18.0),
        ),
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TextFormField(
            autofocus: false,
            cursorHeight: 18.0,
            cursorColor: Colors.white,
            style: FontUtil.setTextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontColor: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(ColorsUtil.fieldFillColor),
              contentPadding: EdgeInsets.all(18.0),
              hintText: 'Name',
              hintStyle: FontUtil.setTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontColor: Colors.white38),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            autofocus: false,
            cursorHeight: 18.0,
            cursorColor: Colors.white,
            style: FontUtil.setTextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontColor: Colors.white),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(ColorsUtil.fieldFillColor),
              contentPadding: EdgeInsets.all(18.0),
              hintText: 'Goal Amount',
              hintStyle: FontUtil.setTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontColor: Colors.white38),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Select Image from Gallery',
            style: FontUtil.setTextStyle(
                fontSize: 24.0, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              getImage();
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 8.0, color: Color(ColorsUtil.fieldFillColor)),
                  image: DecorationImage(
                    image: _image == null
                        ? Image.asset(
                            ImageUtils.imageGallery,
                            height: 50,
                            width: 50,
                          ).image
                        : Image.file(_image).image,
                    fit: _image == null ? null : BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
          ),
          Expanded(child: Container()),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/goalOverView',
                    arguments: GoalOverViewScreenArgs(
                        path: _image != null ? _image.path : '',
                        amount: '2000',
                        goalName: 'Bicycle'));
              },
              child: getBottomButton())
        ],
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget getBottomButton() {
    return Card(
      color: Color(ColorsUtil.fieldFillColor),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 28.0,
              ),
              child: Text(
                'Get Set Go',
                style: FontUtil.setTextStyle(),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

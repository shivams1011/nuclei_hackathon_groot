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
  TextEditingController goalNameController = TextEditingController();
  TextEditingController goalAmountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: goalNameController,
              autofocus: false,
              cursorHeight: 18.0,
              cursorColor: Colors.white,
              validator: (value) =>
                  value.isEmpty ? 'Please Enter Goal Name' : null,
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
              controller: goalAmountController,
              autofocus: false,
              cursorHeight: 18.0,
              cursorColor: Colors.white,
              validator: (value) =>
                  value.isEmpty ? 'Please Enter Goal Amount' : null,
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
            _image == null
                ? Image.asset(
                    ImageUtils.uploadImage,
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  )
                : Image.file(
                    _image,
                    height: 200,
                    width: 300,
                    fit: BoxFit.fitWidth,
                  ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // getImage();
                _showSheet();
              },
              child: Text(
                'Upload Image here',
                style: FontUtil.setTextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: Container()),
            InkWell(
                onTap: () {
                  validateAndSave();
                },
                child: getBottomButton())
          ],
        ),
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

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showSheet() async {
    String data = await showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        enableDrag: true,
        backgroundColor: Color(ColorsUtil.appBgColor),
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.20,
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      getImage();
                    },
                    child: Image.asset(
                      ImageUtils.photosImage,
                      height: 80,
                      width: 80,
                    )),
                SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    getImageCamera();
                  },
                  child: Image.asset(
                    ImageUtils.cameraImage,
                    height: 80,
                    width: 80,
                  ),
                )
              ],
            ),
          );
        });

    setState(() {
      if (data != null) {}
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

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      FocusScope.of(context).requestFocus(new FocusNode());
       Navigator.of(context).pushNamed('/goalOverView',
                      arguments: GoalOverViewScreenArgs(
                          path: _image != null ? _image.path : '',
                          amount: goalAmountController.text,
                          goalName: goalNameController.text));
    } else {
      print('Form is invalid');
    }
  }
}

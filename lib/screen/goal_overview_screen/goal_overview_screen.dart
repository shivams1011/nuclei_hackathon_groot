import 'dart:io';

import 'package:flutter/material.dart';

import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';

class GoalOverViewScreenArgs {
  final String goalName;
  final String amount;
  final String path;

  GoalOverViewScreenArgs({this.amount, this.goalName, this.path});
}

class GoalOverViewScreen extends StatefulWidget {
  GoalOverViewScreen({Key key}) : super(key: key);

  @override
  _GoalOverViewScreenState createState() => _GoalOverViewScreenState();
}

class _GoalOverViewScreenState extends State<GoalOverViewScreen> {
  GoalOverViewScreenArgs args;
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        backgroundColor: Color(ColorsUtil.appBgColor),
        elevation: 0,
      ),
      backgroundColor: Color(ColorsUtil.appBgColor),
      body: getBodyWidget(context),
    );
  }

  Widget getBodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 8.0, color: Color(ColorsUtil.fieldFillColor)),
                  image: DecorationImage(
                    image: args.path.isEmpty
                        ? Image.asset(
                            ImageUtils.imageGallery,
                            height: 50,
                            width: 50,
                          ).image
                        : Image.file(File(args.path)).image,
                    fit: args.path.isEmpty ? null : BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Goal :- ${args.goalName}',
                    style: FontUtil.setTextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Created',
                    style: FontUtil.setTextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Link your Deposit with Goal',
            style: FontUtil.setTextStyle(
                fontSize: 24.0, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              _showSheet();
            },
            child: TextFormField(
              controller: depositController,
              autofocus: false,
              enabled: false,
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
                hintText: 'Select Deposit',
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
          ),
          Expanded(child: Container()),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/goalTracker');
              },
              child: getBottomButton())
        ],
      ),
    );
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
                'Done',
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

  void _showSheet() async {
    String data = await showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        enableDrag: true,
        backgroundColor: Color(ColorsUtil.appBgColor),
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Select Deposit',
                    style: FontUtil.setTextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop('Deposit account:-1111');
                  },
                  title: Text(
                    'Deposit account:-1111',
                    style: FontUtil.setTextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop('Deposit account:-1122');
                  },
                  title: Text(
                    'Deposit account:-1122',
                    style: FontUtil.setTextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        });

    setState(() {
      if (data != null) {
        depositController.text = data;
      }
    });
  }
}

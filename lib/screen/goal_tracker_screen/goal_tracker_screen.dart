import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalTrackerScreen extends StatefulWidget {
  GoalTrackerScreen({Key key}) : super(key: key);

  @override
  _GoalTrackerScreenState createState() => _GoalTrackerScreenState();
}

class _GoalTrackerScreenState extends State<GoalTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: Color(ColorsUtil.appBgColor),
          appBar: AppBar(
            backgroundColor: Color(ColorsUtil.appBgColor),
            elevation: 0,
            title: Text(
              'Goal Tracker',
              style: FontUtil.setTextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          body: getBodyWidget()),
    );
  }

  Widget getBodyWidget() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          getCardData(ImageUtils.carImage, 'Car'),
          getCardData(ImageUtils.byCicleImage, 'Bicycle'),
          getCardData(ImageUtils.smartPhoneImage, 'Smart Phone'),
        ],
      ),
    );
  }

  Widget getCardData(String imageName, String goalName) {
    return Card(
      color: Color(ColorsUtil.accountCardColor),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Color(ColorsUtil.appBgColor),
                    border: Border.all(
                        width: 1.0, color: Color(ColorsUtil.fieldFillColor)),
                    image: DecorationImage(
                        image: Image.asset(
                          imageName,
                          height: 50,
                          width: 50,
                        ).image,
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(goalName,
                            style: FontUtil.setTextStyle(fontSize: 16.0)),
                        Expanded(child: Container()),
                        Text('25% Completed ',
                            style: FontUtil.setTextStyle(fontSize: 14.0)),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    LinearPercentIndicator(
                      width: 250,
                      lineHeight: 8.0,
                      percent: 0.3,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('₹300,000',
                            style: FontUtil.setTextStyle(fontSize: 16.0)),
                        Expanded(child: Container()),
                        Text('₹30,00,000',
                            style: FontUtil.setTextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {

    Navigator.of(context).popUntil(ModalRoute.withName("/home"));
    return true;
    
  }
}

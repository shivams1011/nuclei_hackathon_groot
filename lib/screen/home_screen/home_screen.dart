import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorsUtil.appBgColor),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        ImageUtils.gardiuanImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Text(
                        'Hi, Shivam Sharma',
                        style: FontUtil.setTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Icon(Icons.notes, color: Colors.white,)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              getAccountCard(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showTransationCard(
                      cardColor: ColorsUtil.fieldFillColor,
                      title: 'Day Limit',
                      subTitle: '1,200'),

                  showTransationCard(
                      cardColor: ColorsUtil.fieldFillColor,
                      title: 'Remaining Amount',
                      subTitle: '600'),

                  // showTransationCard(),
                ],
              ),
              Expanded(child: Container()),
              Card(
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
                          'Make Payment',
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
              )
            ],
          ),
        ));
  }

  Widget showTransationCard(
      {@required int cardColor,
      @required String title,
      @required String subTitle}) {
    return Card(
      color: Color(cardColor),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: MediaQuery.of(context).size.height * 0.16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: FontUtil.setTextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                subTitle,
                style: FontUtil.setTextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.w300),
              )
            ],
          )),
    );
  }

  Widget getAccountCard() {
    return Card(
      color: Color(ColorsUtil.accountCardColor),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text(
                        'Account number',
                        style: FontUtil.setTextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            fontColor: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Text(
                        '*******9090',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FontUtil.setTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            fontColor: Colors.white),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                  child: Text(
                    '₹ 50,000',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FontUtil.setTextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        fontColor: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Groot Bank',
                style: FontUtil.setTextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                    fontColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        backgroundColor: Color(ColorsUtil.appBgColor),
        title: Text(
          'All Transactions',
          style: FontUtil.setTextStyle(
            fontSize: 18.0,
          ),
        ),
        elevation: 0,
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Color(ColorsUtil.accountCardColor),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          ImageUtils.gardiuanImage,
                          width: 60,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send To',
                            style: FontUtil.setTextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '8989898989@ybl',
                            style: FontUtil.setTextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '12 Mar 2021, 7:15 PM',
                          style: FontUtil.setTextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w700),
                        ),
                        Expanded(child: Container()),
                        Text(
                          'Success',
                          style: FontUtil.setTextStyle(
                              fontSize: 16.0,
                              fontColor: Color(0xff2FADAC),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

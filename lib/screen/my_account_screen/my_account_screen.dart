import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';

class MyAccountScreen extends StatefulWidget {
  MyAccountScreen({Key key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Account',
          style: FontUtil.setTextStyle(fontSize: 18.0),
        ),
        backgroundColor: Color(ColorsUtil.appBgColor),
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Container(
      width: double.infinity,
        child: Column(
      children: [
        getAccountCard(
          title: 'Saving Account',
          accountType: '',
          balance: '20,000',
          accountNumber: '9090909090'
        ),
        getAccountCard(
          title: 'Deposit Account',
          accountType: 'Fixed Deposit',
          balance: '10,000',
          accountNumber: '123'
        )
      ],
    ));
  }

  Widget getAccountCard({String title, String accountNumber, String balance, String accountType}) {
    return Card(
      color: Color(ColorsUtil.accountCardColor),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(30),
      )),
      child: Container(
        padding: EdgeInsets.all(16.0),
         width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$title', style: FontUtil.setTextStyle(fontSize: 18.0),),
                Text('$accountType', style: FontUtil.setTextStyle(fontSize: 18.0),),
              ],
            ),
            SizedBox(height: 10,),
            Text('A/c no. $accountNumber', style: FontUtil.setTextStyle(fontSize: 16.0),),
            SizedBox(height: 10,),
            Text('Available Balance:- $balance', style: FontUtil.setTextStyle(fontSize: 16.0),)
          ],
        ),
      ),
    );
  }
}

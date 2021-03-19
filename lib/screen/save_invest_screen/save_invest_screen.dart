import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';

class SaveInvestScreen extends StatefulWidget {
  SaveInvestScreen({Key key}) : super(key: key);

  @override
  _SaveInvestScreenState createState() => _SaveInvestScreenState();
}

class _SaveInvestScreenState extends State<SaveInvestScreen> {
  TextEditingController depositTypeController = TextEditingController();
  TextEditingController interestPayoutController = TextEditingController();
  TextEditingController maturityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Open FD/RD',
          style: FontUtil.setTextStyle(fontSize: 18.0),
        ),
        backgroundColor: Color(ColorsUtil.appBgColor),
      ),
      body: getBodyData(),
    );
  }

  Widget getBodyData() {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              _showDepositSheet();
            },
            child: TextFormField(
              controller: depositTypeController,
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
                hintText: 'Select Deposit Type',
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
          SizedBox(
            height: 20,
          ),
          Text(
            'Tenor',
            style: FontUtil.setTextStyle(fontSize: 28.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
                    hintText: 'Months',
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
              SizedBox(width: 10.0),
              Expanded(
                child: TextFormField(
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
                    hintText: 'Days',
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
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              _showInterestSheet();
            },
            child: TextFormField(
              controller: interestPayoutController,
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
                hintText: 'Interest Payout',
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
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              _showMaturitySheet();
            },
            child: TextFormField(
              controller: maturityController,
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
                hintText: 'Maturity Instruction',
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
          getBottomButton()
        ],
      ),
    );
  }

  void _showDepositSheet() async {
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
                    'Select Deposit Type',
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
                    Navigator.of(context).pop('Fixed Deposit');
                  },
                  title: Text(
                    'Fixed Deposit',
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
                    Navigator.of(context).pop('Recurring Deposit');
                  },
                  title: Text(
                    'Recurring Deposit',
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
        depositTypeController.text = data;
      }
    });
  }

  void _showInterestSheet() async {
    String data = await showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        enableDrag: true,
        backgroundColor: Color(ColorsUtil.appBgColor),
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Interest Payout',
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
                    Navigator.of(context).pop('Monthly');
                  },
                  title: Text(
                    'Monthly',
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
                    Navigator.of(context).pop('Quarterly');
                  },
                  title: Text(
                    'Quarterly',
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
                    Navigator.of(context).pop('Half yearly');
                  },
                  title: Text(
                    'Half yearly',
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
                    Navigator.of(context).pop('At Maturity');
                  },
                  title: Text(
                    'At Maturity',
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
        interestPayoutController.text = data;
      }
    });
  }

  void _showMaturitySheet() async {
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
                    'Maturity Instruction',
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
                    Navigator.of(context).pop('Renew Principle & Interest');
                  },
                  title: Text(
                    'Renew Principle & Interest',
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
                    Navigator.of(context).pop('Renew Principle only');
                  },
                  title: Text(
                    'Renew Principle only',
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
                    Navigator.of(context).pop('Credit back to my Account');
                  },
                  title: Text(
                    'Credit back to my Account',
                    style: FontUtil.setTextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });

    setState(() {
      if (data != null) {
        maturityController.text = data;
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
                'Continue',
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

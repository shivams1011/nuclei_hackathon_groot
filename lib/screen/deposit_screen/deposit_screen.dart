import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';

class DepositScreen extends StatefulWidget {
  DepositScreen({Key key}) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {

TextEditingController goalSelectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(ColorsUtil.appBgColor),
        title: Text(
          'Deposit OverView',
          style: FontUtil.setTextStyle(fontSize: 18.0),
        ),
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Container(
      padding: EdgeInsets.all(24.0),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Icon(
            Icons.check_circle,
            size: 56.0,
            color: Colors.green,
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Deposit  A/c no. 1101 is successfully created',
            style: FontUtil.setTextStyle(fontSize: 28.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),

          InkWell(
            onTap: () {
              _showInterestSheet();
            },
            child: TextFormField(
              controller: goalSelectController,
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
                hintText: 'Link your goal',
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

void _showInterestSheet() async {
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
                    'Select goal',
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
                    Navigator.of(context).pop('Car');
                  },
                  title: Text(
                    'Car',
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
                    Navigator.of(context).pop('Bicycle');
                  },
                  title: Text(
                    'Bicycle',
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
        goalSelectController.text = data;
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

}

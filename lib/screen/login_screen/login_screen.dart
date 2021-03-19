import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        backgroundColor: Color(ColorsUtil.appBgColor),
        elevation: 0,
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            'Welcome to \nGroot',
            style: FontUtil.setTextStyle(
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.0,
          ),
          getFieldData()
        ],
      ),
    );
  }

  Widget getFieldData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
            hintText: 'Customer Id',
            hintStyle: FontUtil.setTextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontColor: Colors.white38),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(
          height: 28.0,
        ),
        TextFormField(
          autofocus: false,
          cursorHeight: 18.0,
          cursorColor: Colors.white,
          style: FontUtil.setTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontColor: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(ColorsUtil.fieldFillColor),
            contentPadding: EdgeInsets.all(18.0),
            hintText: 'Password',
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
          height: 36.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(ColorsUtil.buttonColor)),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(18.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)))),
            child: Text(
              'Login',
              style: FontUtil.setTextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/model/login_response.dart';
import 'package:nuclei_hackathon_groot/screen/home_screen/home_screen.dart';
import 'package:nuclei_hackathon_groot/screen/login_screen/view_model/login_screen_provider.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController customerIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    Provider.of<LoginScreenProvider>(context, listen: false);

    customerIdController.text = '122';
    passwordController.text = 'Harry123';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        backgroundColor: Color(ColorsUtil.appBgColor),
        elevation: 0,
      ),

      body: ChangeNotifierProvider<LoginScreenProvider>(
        create: (context) => LoginScreenProvider(),
        child: getBodyWidget(),
      ),

      // body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            'Wings',
            style: FontUtil.setTextStyle(
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.0,
          ),
          Consumer<LoginScreenProvider>(
              builder: (context, LoginScreenProvider myprovide, child) {
            return getFieldData(myprovide);
          })
          // getFieldData()
        ],
      ),
    );
  }

  Widget getFieldData(LoginScreenProvider loginScreenProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: customerIdController,
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
          controller: passwordController,
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
              // Navigator.of(context).pushNamed('/home');

              loginScreenProvider.updateLoader();

              callLoginApi(loginScreenProvider);
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
            child: !loginScreenProvider.loading
                ? Text(
                    'Login',
                    style: FontUtil.setTextStyle(
                      fontSize: 18.0,
                    ),
                  )
                : Container(height: 30, child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  void callLoginApi(LoginScreenProvider loginScreenProvider) async {
    await loginScreenProvider.getPostData(
        context, customerIdController.text.toString(), passwordController.text);

    if (loginScreenProvider.loginSuccess) {
      Navigator.of(context).pop();

      // User user = loginScreenProvider.loginResposne.user;
      print('----------');
      print(loginScreenProvider.loginResposne);
      Navigator.of(context).pushNamed('/home',
          arguments: HomeScreenArgs(
              user: loginScreenProvider.loginResposne.user,
              account: loginScreenProvider.loginResposne.account));
    }
  }
}

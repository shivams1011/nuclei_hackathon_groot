import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuclei_hackathon_groot/model/login_response.dart';
import 'package:nuclei_hackathon_groot/screen/upi_screen/view_model/upi_screen_provider.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:provider/provider.dart';

class UpiPaymentScreenArgs {
  final User user;
  final Account account;

  UpiPaymentScreenArgs({this.user, this.account});
}

class UpiPaymentScreen extends StatefulWidget {
  UpiPaymentScreen({Key key}) : super(key: key);

  @override
  _UpiPaymentScreenState createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  UpiPaymentScreenArgs args;

  TextEditingController upiIdController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(ColorsUtil.appBgColor),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(ColorsUtil.appBgColor),
        title: Text(
          'Payment',
          style: FontUtil.setTextStyle(fontSize: 18.0),
        ),
      ),
      body: ChangeNotifierProvider<UpiScreenProvider>(
        create: (context) => UpiScreenProvider(),
        child: getBodyData(),
      ),
    );
  }

  Widget getBodyData() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: Consumer<UpiScreenProvider>(
              builder: (context, UpiScreenProvider myprovide, child) {
            return Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                TextFormField(
                  controller: upiIdController,
                  autofocus: false,
                  cursorHeight: 18.0,
                  validator: (value) =>
                      value.isEmpty ? 'Please Enter UPI Id' : null,
                  cursorColor: Colors.white,
                  style: FontUtil.setTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontColor: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(ColorsUtil.fieldFillColor),
                    contentPadding: EdgeInsets.all(18.0),
                    hintText: 'Enter UPI Id',
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
                  height: 30.0,
                ),
                TextFormField(
                  controller: amountController,
                  autofocus: false,
                  cursorHeight: 18.0,
                  cursorColor: Colors.white,
                  validator: (value) => (value.isEmpty)
                      ? 'Please Enter Amount'
                      : (args.user.userType == 'M'
                          ? (int.parse(value) <=
                                  int.parse(args.account.remainingLimit)
                              ? null
                              : 'Day Limit Exceed')
                          : null),
                  style: FontUtil.setTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontColor: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(ColorsUtil.fieldFillColor),
                    contentPadding: EdgeInsets.all(18.0),
                    hintText: 'Amount',
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
                !myprovide.loading
                    ? Expanded(child: Container())
                    : Expanded(
                        child: Center(child: CircularProgressIndicator())),
                InkWell(
                    onTap: () {
                      validateAndSave(myprovide);
                    },
                    child: getBottomButton())
              ],
            );
          })),
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
    );
  }

  void _showBottomSheet() async {
    String data = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: Color(ColorsUtil.appBgColor),
        builder: (builder) {
          return Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            height: MediaQuery.of(context).size.height * 0.30,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 56.0,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Payment Success',
                  style: FontUtil.setTextStyle(fontSize: 28.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      Navigator.of(context).popUntil(ModalRoute.withName("/home"));
    });
  }

  void validateAndSave(UpiScreenProvider upiScreenProvider) async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
       FocusScope.of(context).requestFocus(new FocusNode());
      upiScreenProvider.updateLoader();
      await upiScreenProvider.getPostData(context, upiIdController.text,
          amountController.text, args.user.custId, args.user.userType, '1111');

      if (upiScreenProvider.success) {
        _showBottomSheet();
      }
    } else {
      print('Form is invalid');
    }
  }
}

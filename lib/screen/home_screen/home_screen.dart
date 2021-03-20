import 'package:flutter/material.dart';
import 'package:nuclei_hackathon_groot/model/login_response.dart';
import 'package:nuclei_hackathon_groot/utils/colors_util.dart';
import 'package:nuclei_hackathon_groot/utils/font_util.dart';
import 'package:nuclei_hackathon_groot/utils/image_util.dart';

class HomeScreenArgs {
  final User user;
  final Account account;

  HomeScreenArgs({this.user, this.account});
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isViewDetailClicked = false;

  HomeScreenArgs args;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    print(args.user);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(ColorsUtil.appBgColor),
        endDrawer: Drawer(
          child: Container(
            color: Color(ColorsUtil.appBgColor),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text('Wings App',
                    style: FontUtil.setTextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/goalTracker');
                  },
                  title: Text(
                    'Goal Tracker',
                    style: FontUtil.setTextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/transaction');
                  },
                  title: Text(
                    'Transaction History',
                    style: FontUtil.setTextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                if(args.user.userType == 'G')ListTile(
                  title: Text(
                    'Manage limit',
                    style: FontUtil.setTextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: FontUtil.setTextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
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
                        'Hi, ${args.user.firstname} ${args.user.lastname}',
                        style: FontUtil.setTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w800),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          // Scaffold.of(context).openEndDrawer();
                          _scaffoldKey.currentState.openEndDrawer();
                          // Navigator.of(context).pushNamed('/transaction');
                        },
                        child: Icon(
                          Icons.notes,
                          color: Colors.white,
                        ))
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/createGoal');
                    },
                    child: showTransationCard(
                        cardColor: ColorsUtil.fieldFillColor,
                        title: 'Create a goal',
                        subTitle: ''),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/saveInvest');
                    },
                    child: showTransationCard(
                        cardColor: ColorsUtil.fieldFillColor,
                        title: 'Save/Invest',
                        subTitle: ''),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/myAccount');
                    },
                    child: showTransationCard(
                        cardColor: ColorsUtil.fieldFillColor,
                        title: 'My Account',
                        subTitle: ''),
                  ),
                  showTransationCard(
                      cardColor: ColorsUtil.fieldFillColor,
                      title: 'Payment/Transfer',
                      subTitle: ''),
                ],
              ),
            ],
          ),
        ));
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

  Widget showTransationCard({
    @required int cardColor,
    @required String title,
    @required String subTitle,
  }) {
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
              Visibility(
                visible: subTitle.isNotEmpty,
                child: SizedBox(
                  height: 10.0,
                ),
              ),
              Visibility(
                visible: subTitle.isNotEmpty,
                child: Text(
                  subTitle,
                  style: FontUtil.setTextStyle(
                      fontSize: 28.0, fontWeight: FontWeight.w300),
                ),
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 0.0),
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
                          args.account.accountNumber,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: !isViewDetailClicked,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isViewDetailClicked = !isViewDetailClicked;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              'View Details',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontUtil.setTextStyle(
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isViewDetailClicked,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Balance:- ₹${args.account.totalBalance}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontUtil.setTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Amount limit:- ₹${args.account.limitPerDay}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontUtil.setTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Amount spent:- ₹${args.account.remainingLimit}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FontUtil.setTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontColor: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

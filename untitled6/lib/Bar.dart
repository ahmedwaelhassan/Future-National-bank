import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/Certificate.dart';
import 'package:untitled6/Deposit.dart';
import 'package:untitled6/Exchange%20Rate.dart';
import 'package:untitled6/Get%20Card.dart';
import 'package:untitled6/Last%20Transaction.dart';
import 'package:untitled6/Loan%20Amount.dart';
import 'package:untitled6/Login.dart';
import 'package:untitled6/My%20Profile.dart';
import 'package:untitled6/Reports.dart';
import 'package:untitled6/Search.dart';
import 'package:untitled6/Update.dart';
import 'package:untitled6/cert%20request.dart';
import 'package:untitled6/cuurencyConverter.dart';
import 'package:untitled6/home.dart';
import 'package:untitled6/lllons.dart';
import 'Card Type.dart';
import 'Create Account.dart';
import 'Currency.dart';
import 'Delete Acc.dart';
import 'Installment.dart';
import 'Loan.dart';
import 'Transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:http/http.dart' as http;

class PlutoMenuBarDemo extends StatefulWidget {
  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";
  var data;

  PlutoMenuBarDemo(
      {
        required this.Email,
        required this.Password,
        required this.username,
        required this.mobile,
        required this.Gender,
        required this.dob,
        required this.id,
        required this.Adress,
        required this.nationalid,
      }
      );

  @override
  State<PlutoMenuBarDemo> createState() => _PlutoMenuBarDemoState(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid
  );
}
class _PlutoMenuBarDemoState extends State<PlutoMenuBarDemo> {

  var Email="";
  var Password ="";
  var username="";
  var mobile="";
  var Gender="";
  var dob="";
  var id="";
  var Adress="";
  var nationalid="";
  var data;

  _PlutoMenuBarDemoState(
  {
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
}
      );

  late final List<PlutoMenuItem> orangeHoverMenus;

  @override
  void initState() {
    super.initState();
    orangeHoverMenus = _makeMenus(context);
  }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> _makeMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'Home',
        icon: Icons.home,
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => home(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
      ),
      PlutoMenuItem(
        title: ' Accounts ',
        icon: Icons.account_balance,
        children: [
          PlutoMenuItem(
            title: ' Create Account ',
            icon: Icons.create,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => createaccount(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
          ),
          PlutoMenuItem(
              title: ' Search For Account ',
              icon: Icons.search,
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Search(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),))
          ),
        ],
      ),
      PlutoMenuItem(
        title: 'Payments',
        icon: Icons.wallet,
        onTap: (){},
        children: [
          PlutoMenuItem(
            title: ' Deposit / Withdraw ',
            icon: Icons.calculate_outlined,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Deposit(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
          ),
          /*PlutoMenuItem(
            title: ' WithDraw ',
            icon:Icons.minimize_outlined,
            onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => Withdraw(),)),
          ),*/
          PlutoMenuItem(
            title: ' Transfer ',
            icon: Icons.transfer_within_a_station,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => transfers(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
          ),
        ],
      ),
      PlutoMenuItem(
        title: ' Cards ',
        icon: Icons.add_card_outlined,
        onTap: () {},
        children: [
          PlutoMenuItem(
            title: ' Get Card ',
            icon: Icons.add_card,
            onTap: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => GetCard(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
          ),
          PlutoMenuItem(
              title: ' Card Types ',
              icon:Icons.credit_score,
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => CardType(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),))
          ),
        ],
      ),
      PlutoMenuItem(
        title: ' Messages ',
        icon: Icons.report,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Reports(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
      ),
      PlutoMenuItem(
        title: ' More ',
        icon: Icons.apps_outlined,
        children: [
          PlutoMenuItem(
            title: 'Loans',
            icon: Icons.calculate_outlined,
            onTap: () {},
            children: [
              PlutoMenuItem(
                title: 'Loan Requests',
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => loan(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
              ),
              PlutoMenuItem(
                title: ' Loan Installment Calculator ',
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => LoanCalculator(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
              ),
              PlutoMenuItem(
                title: ' Loan Amount Calculator  ',
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => LoanAmount(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
              ),
            ],
          ),
          PlutoMenuItem(
            title: ' Certificates ',
            icon: Icons.picture_as_pdf_outlined,
            onTap: () {},
            children: [
              PlutoMenuItem(
                title: ' Apply for certificate ',
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => certificate(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
              ),
              PlutoMenuItem(
                title: ' Certificate requests ',
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => certificaterequest(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
              ),
            ],
          ),
          PlutoMenuItem(
            title: ' Currencies ',
            icon: Icons.currency_exchange,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => currencyConverter(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),)),
          ),
          PlutoMenuItem(
            title: ' Transactions ',
            icon: Icons.transfer_within_a_station,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>LastTransaction(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid))),
          ),
          PlutoMenuItem(
            title: ' My Profile ',
            icon: Icons.person,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(Email: Email, Password: Password, username: username, mobile: mobile, Gender: Gender, dob: dob, id: id, Adress: Adress, nationalid: nationalid),));
            },
          ),
          PlutoMenuItem(
            title: ' Sign Out ',
            icon: Icons.login_outlined,
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => login(),)),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 6,
        child: Column(
            children: [
              PlutoMenuBar(
                mode: PlutoMenuBarMode.hover,
                itemStyle: const PlutoMenuItemStyle(
                  activatedColor: Colors.white,
                  indicatorColor: Colors.white,
                  textStyle: TextStyle(color: Color(0xff8d0000)),
                  iconColor: Color(0xff8d0000),
                  moreIconColor: Colors.white,
                    padding: EdgeInsets.only(left: 40, right: 150)
                ),
                menus: orangeHoverMenus,
              ),
            ]));}}
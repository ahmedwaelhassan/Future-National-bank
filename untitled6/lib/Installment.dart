import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Bar.dart';
import 'Search.dart';

class Installment extends StatelessWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  Installment({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Installment Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanCalculator(
          Email: Email,
          Password: Password,
          username: username,
          mobile: mobile,
          Gender: Gender,
          dob: dob,
          id: id,
          Adress: Adress,
          nationalid: nationalid),
    );
  }
}

class LoanCalculator extends StatefulWidget {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  LoanCalculator({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  @override
  _LoanCalculatorState createState() => _LoanCalculatorState(
      Email: Email,
      Password: Password,
      username: username,
      mobile: mobile,
      Gender: Gender,
      dob: dob,
      id: id,
      Adress: Adress,
      nationalid: nationalid);
}

class _LoanCalculatorState extends State<LoanCalculator> {
  var Email = "";
  var Password = "";
  var username = "";
  var mobile = "";
  var Gender = "";
  var dob = "";
  var id = "";
  var Adress = "";
  var nationalid = "";

  _LoanCalculatorState({
    required this.Email,
    required this.Password,
    required this.username,
    required this.mobile,
    required this.Gender,
    required this.dob,
    required this.id,
    required this.Adress,
    required this.nationalid,
  });

  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _loanPeriodController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _loanStartDateController =
      TextEditingController();

  String? _installmentAmount;
  List<Map<String, dynamic>>? _installments;

  void _calculateInstallments() {
    double loanAmount = double.parse(_loanAmountController.text);
    num loanPeriod = num.parse(_loanPeriodController.text);
    double interestRate = double.parse(_interestRateController.text);
    DateTime loanStartDate = DateTime.parse(_loanStartDateController.text);

    double r = interestRate / 12;
    double installmentAmount = ((loanAmount / 100) * r) * loanPeriod;
    double total = installmentAmount + loanAmount;
    double monthly = total / loanPeriod;
    double interestAmount = ((loanAmount / 100) * r);
    _installmentAmount = total.toStringAsFixed(2);

    _installments = [];
    double remainingAmount = total;
    for (int i = 0; i < loanPeriod; i++) {
      double principalAmount = installmentAmount;
      remainingAmount -= monthly;

      _installments?.add({
        'day': loanStartDate.day,
        'month': loanStartDate.month,
        'year': loanStartDate.year,
        'installmentAmount': monthly,
        'interestAmount': interestAmount,
        'principalAmount': principalAmount,
        'remainingAmount': remainingAmount,
      });

      loanStartDate = DateTime(
          loanStartDate.year, loanStartDate.month + 1, loanStartDate.day);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                        child: Row(children: [
                      Image(
                        image: AssetImage("images/logo3.jpeg"),
                        height: 150,
                      ),
                      SizedBox(width: 1300),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(
                                      Email: Email,
                                      Password: Password,
                                      username: username,
                                      mobile: mobile,
                                      Gender: Gender,
                                      dob: dob,
                                      id: id,
                                      Adress: Adress,
                                      nationalid: nationalid),
                                ));
                          },
                          icon: Icon(
                            Icons.person_search_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                    ])),
                  ),
                  backgroundColor: Color(0xff8d0000),
                ),
                body: ListView(
                  children: [
                    TabBar(
                      unselectedLabelColor: Color(0xff8d0000),
                      indicator: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          width: 5.0,
                          color: Color(0xff8d0000),
                        ),
                      )),
                      labelColor: Color(0xff8d0000),
                      labelPadding: EdgeInsets.only(right: 0, left: 0),
                      tabs: [
                        PlutoMenuBarDemo(
                            Email: Email,
                            Password: Password,
                            username: username,
                            mobile: mobile,
                            Gender: Gender,
                            dob: dob,
                            id: id,
                            Adress: Adress,
                            nationalid: nationalid),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Text('Loan Installment calculator',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Loan amount',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 500,right: 500,top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: TextField(
                              controller: _loanAmountController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 500),
                                child: Text('Min 5000 EGP',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 500),
                                child: Text('Max 1,500,000 EGP',
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ],
                          ),
                          Divider(thickness: 4, height: 40),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Loan period',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 500,right: 500,top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: TextField(
                              controller: _loanPeriodController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 500),
                                child: Text('Min 6 months',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 500),
                                child: Text('Max 120 months',
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ],
                          ),
                          Divider(thickness: 4, height: 40),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Interest rate (Annual %)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 500,right: 500,top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: TextField(
                              controller: _interestRateController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 500),
                                child: Text('Min 16%',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 500),
                                child: Text('Max 21%',
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ],
                          ),
                          Divider(thickness: 4, height: 40),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                    'Date of first Installment (yyyy-mm-dd)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 500,right: 500,top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ]),
                            child: TextField(
                              controller: _loanStartDateController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                              margin: EdgeInsets.only(left: 600,right: 600,top: 10),
                              width: size.width * 0.9,
                              child: ClipRRect(
                                child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                                      // color: Colors.deepOrange,
                                      onPressed: () async {
                                        if (_loanAmountController.text == '' ||
                                            _loanPeriodController.text == '' ||
                                            _interestRateController == '') {
                                          Fluttertoast.showToast(
                                            msg: 'please fill-in the form!',
                                            backgroundColor: Color(0xff1e2023),
                                            textColor: Colors.white,
                                            toastLength: Toast.LENGTH_SHORT,
                                          );
                                        } else if (int.parse(
                                                    _loanAmountController
                                                        .text) >=
                                                5000 &&
                                            int.parse(_loanAmountController
                                                    .text) <=
                                                1500000 &&
                                            int
                                                    .parse(_loanPeriodController
                                                        .text) >=
                                                6 &&
                                            int
                                                    .parse(_loanPeriodController
                                                        .text) <=
                                                120 &&
                                            int.parse(_interestRateController
                                                    .text) >=
                                                16 &&
                                            int.parse(_interestRateController
                                                    .text) <=
                                                21) {
                                          _calculateInstallments();
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                'please check the constraints of the form!',
                                            backgroundColor: Color(0xff1e2023),
                                            textColor: Colors.white,
                                            toastLength: Toast.LENGTH_SHORT,
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Calculate',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff8d0000)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                side: BorderSide(
                                                    color: Color(0xff8d0000))),
                                          )),
                                    )),
                              )),
                          if (_installmentAmount != null) ...[
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  'Total Installment: $_installmentAmount EGP',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Text('Installment Details:',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 450,
                              child: ListView.builder(
                                // shrinkWrap: true,
                                itemCount: _installments?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final installment = _installments![index];
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Receipt ${index + 1}: (${installment['day']}/${installment['month']}/${installment['year']})',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Installment: ${installment['installmentAmount'].toStringAsFixed(2)}\nInterest: ${installment['interestAmount'].toStringAsFixed(2)}\nRemaining: ${installment['remainingAmount'].toStringAsFixed(2)}',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        height: 15,
                                        thickness: 3,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    )
                  ],
                ))));
  }
}

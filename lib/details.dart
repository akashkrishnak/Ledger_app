import "package:flutter/material.dart";
import 'report.dart';
import 'drop.dart';

class mydetails extends StatefulWidget {
  int amount = 0;
  String name = "";
  mydetails.info({required this.name, required this.amount});
  @override
  State<mydetails> createState() =>
      mydetailsState.info(name: name, amount: amount);
}

class mydetailsState extends State<mydetails> {
  String dropdownValue = "Food";
  int amount = 0;
  int food = 0;
  int trans = 0;
  int enter = 0;
  int bills = 0;
  int med = 0;
  int other = 0;
  String name = "";
  String display = "";
  Color color = Colors.black;
  int i = 0;
  mydetailsState.info({required this.name, required this.amount});
  TextEditingController am = TextEditingController();

  List<String> transactions = [];
  List<Color> rainbow = [];

  @override
  Widget build(BuildContext context) {
    void addexpense(TextEditingController am, String? dropdownValue) {
      transactions.insert(0, ("₹${am.text} spent for ${dropdownValue}"));
      rainbow.insert(0, Colors.red);
    }

    void addincome(TextEditingController am) {
      transactions.insert(0, "₹${am.text} added to wallet");
      rainbow.insert(0, Colors.green);
    }

    void increase(TextEditingController am) {
      setState(() {
        amount = amount + int.parse(am.text);
      });
    }

    void decrease(TextEditingController am) {
      setState(() {
        if (amount == 0) {
          amount = 0;
        } else {
          amount = amount - int.parse(am.text);
        }
      });
    }

    void minalert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text("Alert",
              style: TextStyle(
                color: Colors.red
              ),
              ),
              content: SizedBox(
                height: 50,
                child: Text("Insufficient fund in wallet",
                style: TextStyle(
                  fontSize: 17
                ),
                ),
              ),
            );
          });
    }

    void pop(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Enter debit details'),
              content: SizedBox(
                height: 180,
                child: Column(
                  children: [
                    Container(
                      child: drop(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: am,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: "Amount",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 12, 0, 1),
                      child: ElevatedButton(
                        onPressed: () {
                          if (int.parse(am.text) > amount) {
                            minalert(context);
                          } else {
                            dropdownValue = drop.dropdownValue;
                            if (dropdownValue == "Food") {
                              food = food + int.parse(am.text);
                            }
                            if (dropdownValue == "Transport") {
                              trans = trans + int.parse(am.text);
                            }
                            if (dropdownValue == "Entertainment") {
                              enter = enter + int.parse(am.text);
                            }
                            if (dropdownValue == "Bills") {
                              bills = bills + int.parse(am.text);
                            }
                            if (dropdownValue == "Medicine") {
                              med = med + int.parse(am.text);
                            }
                            if (dropdownValue == "Other") {
                              other = other + int.parse(am.text);
                            }
                            addexpense(am, dropdownValue);
                            drop.dropdownValue = "Food";
                            decrease(am);
                            am.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    )
                  ],
                ),
              ));
        },
      );
    }

    void popamount(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text('Enter credit details'),
              content: SizedBox(
                height: 130,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: am,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: "Amount",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 12, 0, 1),
                      child: ElevatedButton(
                        onPressed: () {
                          increase(am);
                          addincome(am);
                          Navigator.pop(context);
                          am.clear();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    )
                  ],
                ),
              ));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "${name}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
      body: Center(
          child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 15, left: 5, right: 5),
              height: 130,
              color: Colors.amber,
              child: Center(
                child: Text(
                  "Net Balance: ₹${amount}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.625,
            child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(
                        transactions[index],
                        style: TextStyle(
                            color: rainbow[index],
                            fontSize: 23,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 25, top: 5),
                child: TextButton(
                  onPressed: () {
                    popamount(context);
                  },
                  child: Text(
                    "Credit",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: Colors.white,
                      backgroundColor: Colors.green),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 25),
                child: TextButton(
                  onPressed: () {
                    pop(context);
                  },
                  child: Text("Debit", style: TextStyle(fontSize: 25)),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.white,
                      backgroundColor: Colors.red),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => report(
                              food: food,
                              trans: trans,
                              enter: enter,
                              bills: bills,
                              med: med,
                              other: other))),
                    );
                  },
                  child: Text("Report", style: TextStyle(fontSize: 25)),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.white,
                      backgroundColor: Colors.amber),
                ),
              ),
            ],
          ),
        ],
      )),
      backgroundColor: Colors.black,
    );
  }
}

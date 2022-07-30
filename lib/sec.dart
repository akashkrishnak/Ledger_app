import 'dart:convert';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void initState() {
    super.initState();
    // getlist();
  }

  List<String> walletname = [];
  List<int> amount = [];

  void addtolist() {
    setState(() {
      walletname.insert(0, read.text);
      // savelist();
    });
  }

  void addtoamount() {
    setState(() {
      amount.insert(0, int.parse(money.text));
    });
  }

  void delshow(BuildContext context, index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("Do you want to delete this wallet?"),
            content: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: TextButton(
                      onPressed: () {
                        delete(index);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(fontSize: 20, color: Colors.amber),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No",
                        style: TextStyle(fontSize: 20, color: Colors.amber)))
              ],
            ),
          );
        });
  }

  void delete(index) {
    setState(() {
      int i;
      walletname.removeAt(index);
      // savelist();
      for (i = index; i < amount.length - 1; i++) {
        amount[i] = amount[i + 1];
      }
    });
  }

  void pop(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Enter wallet details'),
            content: SizedBox(
              height: 190,
              child: Column(
                children: [
                  TextField(
                    controller: read,
                    decoration: new InputDecoration(
                        hintText: "Wallet name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: money,
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
                        if (read.text != "" && money.text != "") {
                          addtolist();
                          addtoamount();
                        }
                        read.clear();
                        money.clear();
                        Navigator.pop(context);
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

  TextEditingController read = TextEditingController();
  TextEditingController money = TextEditingController();
  @override
  Widget build(BuildContext context) {
    listfun() {
      if (walletname.isEmpty) {
        return 0;
      } else {
        return walletname.length;
      }
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Personal Ledger",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: walletname.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                                margin: EdgeInsets.all(6),
                                height: 150,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                mydetails.info(
                                                  name: walletname[index],
                                                  amount: amount[index],
                                                )));
                                  },
                                  onLongPress: () {
                                    HapticFeedback.vibrate();
                                    delshow(context, index);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding:
                                              EdgeInsets.only(left: 15, top: 7),
                                          child: Text(
                                            '${walletname[index]}',
                                            style: TextStyle(
                                              fontSize: 37,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 80,
                                          margin: EdgeInsets.only(
                                              top: 1, right: 20),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            '₹ ${amount[index]}',
                                            style: TextStyle(
                                              fontSize: 28,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }))),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      elevation: 10,
                      onPressed: () {
                        pop(context);
                      },
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 50),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent
        );
  }

  // savelist() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList("wallet", walletname);
  // }

  // getlist() async {
  //   prefs = await SharedPreferences.getInstance();
  //   walletname = prefs.getStringList("wallet") ?? walletname;
  //   setState(() {});
  // }
}

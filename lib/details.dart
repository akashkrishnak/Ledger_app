import "package:flutter/material.dart";

class mydetails extends StatefulWidget {
  int amount = 0;
  String name = "";
  mydetails({required this.name, required this.amount});
  @override
  State<mydetails> createState() => _mydetailsState(name: name, amount: amount);
}

class _mydetailsState extends State<mydetails> {
  int amount = 0;
  String name = "";
  String display = "";
  Color color = Colors.black;
  int i = 0;
  _mydetailsState({required this.name, required this.amount});
  void decrease() {
    setState(() {
      if (amount == 0) {
        amount = 0;
      } else {
        amount = amount - 10;
      }
    });
  }

  void popamount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Enter transaction details"),
          content: SizedBox(
            height:150,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Amount"),
                ),
                Container(
                  
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void increase() {
    setState(() {
      amount = amount + 10;
    });
  }

  void addexpense() {
    transactions.insert(0, ("Debited amount ₹10"));
    rainbow.insert(0, Colors.red);
  }

  void addincome() {
    transactions.insert(0, "Credited amount ₹10");
    rainbow.insert(0, Colors.green);
  }

  List<String> transactions = [];
  List<Color> rainbow = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              name,
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
                              fontSize: 20,
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
                  margin: EdgeInsets.only(right: 25, top: 10),
                  child: TextButton(
                    onPressed: () {
                      increase();
                      addincome();
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
                      decrease();
                      addexpense();
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
                      decrease();
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
        )));
  }
}

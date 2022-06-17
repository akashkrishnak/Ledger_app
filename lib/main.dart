import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> walletname = [];
  List<num> amount = [];
  void addtolist() {
    setState(() {
      walletname.insert(0, read.text);
    });
  }

  void pop(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
            title: Text('Enter wallet name'),
            content: SizedBox(
              height: 105,
              child: Column(
                children: [
                  TextField(
                    controller: read,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 7, 0, 1),
                    child:
                        ElevatedButton(onPressed: () {
                          addtolist();
                        }, child: Text("Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber
                        ),
                        ),
                  )
                ],
              ),
            ));
      },
    );
  }

  TextEditingController read = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Personal Ledger",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:25
        ),
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
                            child: Card(
                              elevation: 5,
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child:Text(
                                '${walletname[index]}',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ), 
                              )
                            ));
                      }))),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 7, 7),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor:Colors.amber,
                elevation: 10,
                onPressed: () {
                  pop(context);
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}

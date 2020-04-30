import "package:flutter/material.dart";
// import "package:intl/intl.dart";

import 'package:money_man/Widgets/new_txn.dart';
import "./Widgets/inside_card.dart";
import "./Models/txn_detail.dart";
import "./Widgets/chart.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // final titleController = TextEditingController();
  // final priceController = TextEditingController();

  @override
  _MyAppState createState() => _MyAppState();
}

// --------------------A P P - S T A T E----------------------------------------------//

class _MyAppState extends State<MyApp> {
  final List txnList = [
    TxnDetail(
      title: "Casio Watch",
      price: 99,
      date: DateTime.now().subtract(Duration(days: 2)),
      id: DateTime.now().toString(),
    ),
    // TxnDetail(
    //   title: "Nike Shoes",
    //   price: 50.99,
    //   date: DateTime.now().subtract(Duration(days: 1)),
    //   id: DateTime.now().toString(),
    // ),
    // TxnDetail(
    //   title: "Mobile Cover",
    //   price: 70.25,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    //   id: DateTime.now().toString(),
    // ),
  ];

  void newTxn(String txnTitle, double txnPrice) {
    final tmpTxn = TxnDetail(
        title: txnTitle,
        price: txnPrice,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      txnList.insert(0, tmpTxn);
    });
  }

  void delTxn(int idx) {
    setState(() => txnList.removeAt(idx));
  }

//----------------------------------------------------------------//

  void startAddNewTxn(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.black,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTxn(newTxn),
          behavior: HitTestBehavior.translucent,
        );
      },
    );
  }

//----------------------B U I L D------------------------------------------//

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      actions: <Widget>[
        Builder(
          builder: (cntxt) => IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTxn(cntxt),
          ),
        ),
      ],
      centerTitle: true,
      bottom: PreferredSize(
        child: Container(
          color: Colors.red,
          height: 6.0,
        ),
        preferredSize: Size.fromHeight(7.0),
      ),
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      title: Text(
        "Expense Manager",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    return MaterialApp(
      title: "Expense Manager",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: appbar,

// ----------------------------B O D Y--------------------------------------------//

        body: txnList.length == 0
            ? Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                        top: 150,
                      ),
                      child: Image.asset(
                        "assets/images/emptyState.png",
                        height: 200,
                        width: 300,
                      )),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "All Empty . . .",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "ComicNeue",
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Builder(
                      builder: (ctx) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: double.infinity,
                        height: (MediaQuery.of(ctx).size.height -
                                appbar.preferredSize.height -
                                MediaQuery.of(ctx).padding.top) *
                            0.17,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Chart(txnList),
                      ),
                    ),
                    Builder(
                      builder: (ctxt) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          height: (MediaQuery.of(ctxt).size.height -
                                  appbar.preferredSize.height -
                                  MediaQuery.of(ctxt).padding.top) *
                              0.72,
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              return InsideCard(txnList[index], index, delTxn);
                            },
                            itemCount: txnList.length,
                          )),
                    ),
                  ],
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (cntxt) => FloatingActionButton(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () => startAddNewTxn(cntxt),
          ),
        ),
      ),
    );
  }
}

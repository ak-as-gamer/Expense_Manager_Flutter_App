import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import 'package:money_man/Models/txn_detail.dart';

class InsideCard extends StatelessWidget {
  final TxnDetail txn;
  final int idx;
  final Function delTxnHandle;

  InsideCard(this.txn, this.idx, this.delTxnHandle);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(60, 60, 60, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Text("\$${txn.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                )),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.red,
            )),
            padding: EdgeInsets.all(10),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(txn.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
                Text(DateFormat.yMMMd().format(txn.date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.greenAccent,
                    )),
              ],
            ),
          ),
          FlatButton(
            child: Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
            onPressed: () => delTxnHandle(idx),
          ),
        ],
      ),
    );
  }
}

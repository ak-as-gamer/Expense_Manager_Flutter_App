import "package:flutter/foundation.dart";

class TxnDetail {
  final String title;
  final double price;
  final DateTime date;
  final String id;

  TxnDetail({@required this.title, @required this.price, @required this.date,@required this.id});
}

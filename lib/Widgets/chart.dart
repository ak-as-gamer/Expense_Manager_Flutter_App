import "package:flutter/material.dart";
import "package:intl/intl.dart";
import 'package:money_man/Widgets/chart_bar.dart';

// import "../Models/txn_detail.dart";

class Chart extends StatelessWidget {
  final List recentTxn;

  Chart(this.recentTxn);

  List<Map<String, Object>> get groupedTxnValues {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(Duration(days: (6 - index)));

        double amountSpentInDay = 0.0;

        for (int i = 0; i < recentTxn.length; ++i) {
          if (recentTxn[i].date.day == weekday.day &&
              recentTxn[i].date.month == weekday.month &&
              recentTxn[i].date.year == weekday.year) {
            amountSpentInDay += recentTxn[i].price;
          }
        }

        return {
          "day": DateFormat.E().format(weekday).substring(0, 2),
          "amount": amountSpentInDay,
        };
      },
    );
  }

  double get amountSpentInWeek {
    return groupedTxnValues.fold(0.0, (sum, item) {
      return (sum + item["amount"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Container(
    //   margin: EdgeInsets.symmetric(vertical: 10),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //       borderRadius: BorderRadius.circular(10),
    //     ),
        // child: 
        Card(
          borderOnForeground: true,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTxnValues.map((elm) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    elm["day"],
                    elm["amount"],
                    amountSpentInWeek == 0.0
                        ? 0.0
                        : (elm["amount"] as double) / amountSpentInWeek,
                  ));
            }).toList(),
          ),
        // ),
      // ),
    );
  }
}

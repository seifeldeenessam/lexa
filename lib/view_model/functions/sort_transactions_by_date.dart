import 'package:lexa/view_model/functions/create_valid_date.dart';
import 'package:lexa/view_model/functions/format_date.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/widgets/records/expandable_record.dart';

Widget sortTransactionsByDate(List<Map<String, dynamic>>? transactions, BuildContext context) {
  List<String> dates = [];

  for (var transaction in transactions!) {
    String invalidDate = transaction["occurrenceDate"].toString().split('T')[0];
    dates.add(formateDate(createValidDate(invalidDate)));
  }

  List distinctDates = dates.toSet().toList();

  return ListView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: distinctDates.length,
    itemBuilder: (context, distinctDatesIndex) {
      return Container(
        margin: const EdgeInsets.only(bottom: mainUnit),
        padding: const EdgeInsets.only(top: mainUnit / 2, right: mainUnit / 2, left: mainUnit / 2),
        decoration: BoxDecoration(color: colorOnBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(distinctDates[distinctDatesIndex], style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colorTertiary)),
                Text("value E£", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
              ],
            ),
            const SizedBox(height: mainUnit / 2),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, listItemsIndex) {
                String invalidDate = transactions[listItemsIndex]["occurrenceDate"].toString().split('T')[0];
                String validDate = formateDate(createValidDate(invalidDate));
                if (validDate == distinctDates[distinctDatesIndex]) {
                  return ExpandableRecord(
                    id: transactions[listItemsIndex]["id"],
                    image: transactions[listItemsIndex]["category"],
                    title: transactions[listItemsIndex]["title"],
                    price: transactions[listItemsIndex]["price"].toString(),
                    date: validDate,
                    category: transactions[listItemsIndex]["category"],
                    note: transactions[listItemsIndex]["note"],
                    billingAccount: transactions[listItemsIndex]["billingAccount"],
                    currentBalance: transactions[listItemsIndex]["currentBalance"].toString(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

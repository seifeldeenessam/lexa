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
        margin: EdgeInsets.only(bottom: Units().spacing),
        padding: EdgeInsets.only(top: Units().spacing / 2, right: Units().spacing / 2, left: Units().spacing / 2),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(Units().borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(distinctDates[distinctDatesIndex], style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                Text("value E£", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
              ],
            ),
            SizedBox(height: Units().spacing / 2),
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

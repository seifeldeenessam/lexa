import 'package:flutter/material.dart';
import 'package:lexa/theme/constants.dart';
import 'package:lexa/widgets/records/checkbox_record.dart';
import 'package:lexa/utilities/create_valid_date.dart';
import 'package:lexa/utilities/format_date.dart';

Widget sortWishlistByDate(BuildContext context, List<Map<String, dynamic>>? wishlistItems) {
  List<String> dates = [];

  for (var item in wishlistItems!) {
    String invalidDate = item["createdAt"].toString().split('T')[0];
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
                Text("count", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.tertiary)),
              ],
            ),
            SizedBox(height: Units().spacing / 2),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: wishlistItems.length,
              itemBuilder: (context, listItemsIndex) {
                String invalidDate = wishlistItems[listItemsIndex]["createdAt"].toString().split('T')[0];
                String validDate = formateDate(createValidDate(invalidDate));
                if (validDate == distinctDates[distinctDatesIndex]) {
                  return CheckboxRecordWidget(
                    id: wishlistItems[listItemsIndex]["id"],
                    title: wishlistItems[listItemsIndex]["title"],
                    price: wishlistItems[listItemsIndex]["price"],
                    note: wishlistItems[listItemsIndex]["note"],
                    link: wishlistItems[listItemsIndex]["link"],
                    isImportant: wishlistItems[listItemsIndex]["isImportant"],
                    isChecked: wishlistItems[listItemsIndex]["isChecked"],
                  );
                } else {
                  return const SizedBox();
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: Units().spacing / 2),
            ),
          ],
        ),
      );
    },
  );
}

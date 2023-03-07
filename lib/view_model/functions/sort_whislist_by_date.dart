import 'package:lexa/view_model/functions/create_valid_date.dart';
import 'package:lexa/view_model/functions/format_date.dart';
import 'package:lexa/view_model/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:lexa/view_model/widgets/records/checkbox_record.dart';

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
                Text("count", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorTertiary)),
              ],
            ),
            const SizedBox(height: mainUnit / 2),
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
              separatorBuilder: (context, index) => const SizedBox(height: mainUnit / 2),
            ),
          ],
        ),
      );
    },
  );
}
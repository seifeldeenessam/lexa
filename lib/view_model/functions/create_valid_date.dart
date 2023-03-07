DateTime createValidDate(String invalidDate) {
  DateTime validDate = DateTime(
    int.parse(invalidDate.split('-')[0]),
    int.parse(invalidDate.split('-')[1]),
    int.parse(invalidDate.split('-')[2]),
  );
  return validDate;
}

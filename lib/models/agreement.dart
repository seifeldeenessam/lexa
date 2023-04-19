class Agreement {
  int id;
  String loaner;
  double value;
  String date;
  String condition;
  bool isPaidOff;

  Agreement({
    required this.id,
    required this.loaner,
    required this.value,
    required this.date,
    required this.condition,
    required this.isPaidOff,
  });

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "loaner": loaner,
      "value": value,
      "date": date,
      "condition": condition,
      "isPaidOff": isPaidOff,
    };
  }
}

List<Agreement> loansList = [
  Agreement(
    id: 1,
    loaner: "Ziad Ahmed",
    value: 25.0,
    date: "22/5/2022",
    condition: "debtor",
    isPaidOff: false,
  ),
  Agreement(
    id: 2,
    loaner: "Shelby",
    value: 155.0,
    date: "22/5/2022",
    condition: "debtor",
    isPaidOff: true,
  ),
  Agreement(
    id: 3,
    loaner: "Mohamed Alaa",
    value: 120.0,
    date: "20/5/2022",
    condition: "debtor",
    isPaidOff: false,
  ),
  Agreement(
    id: 3,
    loaner: "Youssef Nasser",
    value: 40.0,
    date: "19/5/2022",
    condition: "creditor",
    isPaidOff: false,
  ),
];

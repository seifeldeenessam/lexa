import 'package:lexa/model/database/local_database.dart';

class WishlistScreenViewModel {
  Future<List<Map<String, dynamic>>> loadData() async {
    List<Map<String, dynamic>> items = [];

    final LocalDatabase localStorage = LocalDatabase();
    await localStorage.read("wishlist").then((value) => items = value);

    return items;
  }
}

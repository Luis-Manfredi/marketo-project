import 'package:marketo/data/list_item_class.dart';

class UserList {
  final String name;
  final List products;

  UserList({
    required this.name,
    required this.products
  });
}

List<UserList> userLists = [];

String listName = 'My New List';

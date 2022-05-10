import 'package:marketo/data/list_item_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyName = 'name';
  static const _keyItems = 'items';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // List Name configuration
  static Future setListName(String name) async =>
      await _preferences?.setString(_keyName, name);

  static String? getListName() => _preferences?.getString(_keyName);

  // Items preferences configuration
  static Future setListItems(List<ListItem> items) async {
    final listItems = items.map((e) => e.toString()).toList();
    return await _preferences?.setStringList(_keyItems, listItems);
  }

  static List<ListItem>? getListItems() {
    final items = _preferences?.getStringList(_keyItems);
    return items!.map((e) => (e as ListItem)).toList();
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vara/models/default_data.dart';

class Global {
  static MyStoreage myStoreage = MyStoreage();

  static Future init() async {
    String _dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$_dir/storeage.json');
    bool mark = await file.exists();
    if (mark) {
      String contents = await file.readAsString();
      myStoreage = MyStoreage.fromJson(json.decode(contents));
    } else {
      MyStoreage storeage = MyStoreage();
      storeage.isCloud = true;
      storeage.path = (await getApplicationDocumentsDirectory()).path;
      await file.writeAsString(storeage.toJson());
      myStoreage = storeage;
    }
    print(myStoreage.path);
  }
}

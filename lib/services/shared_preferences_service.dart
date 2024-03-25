import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';


class SharedPreferenceService with ListenableServiceMixin {
  //---------------------[SERVICES]----------------------------------

  //---------------------[FUNCTIONS]-----------------------------------

  Future saveData(String key, data) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (data.runtimeType == String) {
      await sharedPreference.setString(key, data);
    } else if (data.runtimeType == int) {
      await sharedPreference.setInt(key, data);
    } else if (data.runtimeType == bool) {
      await sharedPreference.setBool(key, data);
    } else if (data.runtimeType == List<String>) {
      await sharedPreference.setStringList(key, data);
    }
  }

  Future<String> getStringData(String key) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString(key) ?? "";
  }

  Future<int> getIntData(String key) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getInt(key) ?? -1;
  }

  Future<bool> getBoolData(String key) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getBool(key) ?? false;
  }

  Future<List<String>?> getStringListData(String key) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getStringList(key);
  }

  Future removeData(String key) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove(key);
  }


}
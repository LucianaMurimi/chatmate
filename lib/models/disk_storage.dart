import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DiskStorage{
  Future saveToDisk(username, email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);
  }

  Future<List> readFromDisk() async {
    List result = [];

    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    result.add(username);
    final email = prefs.getString('email') ?? '';
    result.add(email);
    final passwd = prefs.getString('passwd') ?? '';
    result.add(passwd);
    return result;
  }
}

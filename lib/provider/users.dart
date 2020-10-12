import 'dart:math';

import 'package:crudeflutter/data/dummy_users.dart';
import 'package:crudeflutter/user.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  // para ntificar das alteraçoes graficas

  final Map<String, User> _items = {...DUMMY_USERS};
  //criando metodo mportantes aqui

  List<User> get all {
    return [..._items.values]; // clone da lista
  }

  int get count {
    // notifyListeners() método a disposição do (with ChangeNotifier)
    //apos isso definir o provider na arvore inicial lá em "main.dart"
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: 'id', // numero 1000 foi substituido por id
          name: 'user.name',
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }
  // o provider se comunica com o notfyListners

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}

import 'package:crudeflutter/components/user_tile.dart';
import 'package:crudeflutter/provider/users.dart';
import 'package:crudeflutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// foi importado aqui a library material

class UserList extends StatefulWidget {
  // StatelessWidget --> convertido para StatfulWidget
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int get index => null;
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}

// chamada para alterar --->>users.put(User(
// id: '4',
//  name: 'Francisco',
// email: 'francisco06@hotmail.com',
// avatarUrl: ''));

//chamada papra excluir -->>> users.remove(users.byIndex(0)); metodo para exluir, mas pelo botão de +
//users.put(User(
// name: 'Teste',
// email: 'Chagassilva06@hotmail.com',
// avatarUrl: ''));

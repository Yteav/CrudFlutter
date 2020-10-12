import 'package:crudeflutter/provider/users.dart';
import 'package:crudeflutter/routes/app_routes.dart';
import 'package:crudeflutter/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//nessa parte sempre importar a bliblioteca material

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    //container foi substituido ele possui  posiçoes definidas
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        // aqui o Row foi substituido por container
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Excluir Usuário'),
                          content: Text('Tem Certeza?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Não'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            FlatButton(
                                child: Text('Sim'),
                                onPressed: () =>
                                    Navigator.of(context).pop(true)),
                          ],
                        )).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Users>(context, listen: false).remove(user);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

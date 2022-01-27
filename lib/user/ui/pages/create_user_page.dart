import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/services/services.dart';
import 'package:app_llevaloo/user/ui/widgets/widgets.dart';
import 'package:app_llevaloo/user/domain/models/models.dart';
import 'package:app_llevaloo/user/ui/pages/pages.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);
  static const String routeName = 'create_user';

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  User user = User(Name: '', LastName: '', Phone: '');

  @override
  void initState() {
    super.initState();
    final socketProvider = Provider.of<SocketService>(context, listen: false);
    socketProvider.socket.on('create-user', (payload) {
      socketProvider.createNotification();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    final socketProvider = Provider.of<SocketService>(context, listen: true);
    final _controllerName = TextEditingController();
    final _controllerPhone = TextEditingController();
    final _controllerLastName = TextEditingController();

    return Scaffold(
        appBar:
            appBarTheme(context, 'Crear Usuario', socketProvider.notification),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
              key: userProvider.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controllerName,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 2)),
                      hintText: 'nombre',
                      labelText: 'Nombre del nuevo usuario',
                      labelStyle: TextStyle(color: Colors.indigo, fontSize: 12),
                    ),
                    onChanged: (value) {
                      user.Name = value;
                    },
                    validator: (value) {
                      return value == '' ? 'Nombre es obligatorio' : null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerLastName,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 2)),
                      hintText: 'apellido',
                      labelText: 'Apellido del nuevo usuario',
                      labelStyle: TextStyle(color: Colors.indigo, fontSize: 12),
                    ),
                    onChanged: (value) {
                      user.LastName = value;
                    },
                    validator: (value) {
                      return value == '' ? 'Apellido es obligatorio' : null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerPhone,
                    autocorrect: false,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 2)),
                      hintText: 'Telefono',
                      labelText: 'Telefono del nuevo usuario',
                      labelStyle: TextStyle(color: Colors.indigo, fontSize: 12),
                    ),
                    onChanged: (value) {
                      user.Phone = value;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.indigo,
                    elevation: 0,
                    disabledColor: Colors.grey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 80),
                      child: Text(
                          userProvider.isLoading
                              ? 'Espere...'
                              : 'Crear usuario',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17)),
                    ),
                    onPressed: userProvider.isLoading
                        ? null
                        : () {
                            _crearUser(context, user, userProvider);
                          },
                  )
                ],
              )),
        ));
  }

  void _crearUser(BuildContext context, User body, UsersProvider userProvider) {
    FocusScope.of(context).unfocus();
    if (!userProvider.isValidForm()) return;
    userProvider.isLoading = true;
    userProvider.createUser(body);
    userProvider.isLoading = false;
    Navigator.pushReplacementNamed(context, HomeUserPage.routeName);
  }
}

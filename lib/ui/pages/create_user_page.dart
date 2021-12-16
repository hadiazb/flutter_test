import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Ours
import 'package:app_llevaloo/providers/providers.dart';
import 'package:app_llevaloo/ui/pages/pages.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);
  static const String routeName = 'create_user';

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    _crearUser() async {
      FocusScope.of(context).unfocus();
      if (!userProvider.isValidForm()) return;
      userProvider.isLoading = true;
      await userProvider.createUser();
      userProvider.isLoading = false;
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Usuarios'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
              key: userProvider.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
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
                    onChanged: (value) => userProvider.nombre = value,
                    validator: (value) {
                      return value == '' ? 'Nombre es obligatorio' : null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                    onChanged: (value) => userProvider.apellido = value,
                    validator: (value) {
                      return value == '' ? 'Apellido es obligatorio' : null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 2)),
                      hintText: 'edad',
                      labelText: 'Edad del nuevo usuario',
                      labelStyle: TextStyle(color: Colors.indigo, fontSize: 12),
                    ),
                    onChanged: (value) => userProvider.edad = value,
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          focusColor: Colors.indigo,
                          activeColor: Colors.indigo,
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int?;
                            });
                            userProvider.sexo = true;
                          }),
                      const Text('Hombre'),
                      Radio(
                          focusColor: Colors.indigo,
                          activeColor: Colors.indigo,
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int?;
                            });
                            userProvider.sexo = false;
                          }),
                      const Text('Mujer'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _ButtonSend(userProvider, _crearUser)
                ],
              )),
        ));
  }

  MaterialButton _ButtonSend(
      UsersProvider userProvider, Future<void> Function() _crearUser) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.indigo,
        elevation: 0,
        disabledColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          child: Text(userProvider.isLoading ? 'Espere...' : 'Crear usuario',
              style: const TextStyle(color: Colors.white, fontSize: 17)),
        ),
        onPressed: userProvider.isLoading
            ? null
            : () {
                _crearUser();
              });
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/General/login_controller.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_service_locator.dart';



class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final stateManager = getIt<LoginController>();

  Widget build(BuildContext context){
  MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Log In'),),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/2.3),
          child: Card(
            color: Color(0xFFFFFFFF),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image(
                      image: AssetImage('assets/usuario.png'),
                      width: 90,
                      height: 90,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    obscureText: false,
                    controller: stateManager.textCorreo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electrónico',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    obscureText: true,
                    controller: stateManager.textContrasena,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                
                MostrarBoton(),
              ],
            )
          ),
        ),
      ),
    );
  }
}

class MostrarBoton extends StatelessWidget{
  MostrarBoton({Key? key}) : super(key: key);
  final stateManager = getIt<LoginController>();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<loginState>(
      valueListenable: stateManager.loginNotifier, 
      builder: (context, loginEstado, child){
        return Column(
          children: [
            if (loginEstado == loginState.inicio) ... [
              Boton(),
            ],
            if (loginEstado == loginState.incorrecto) ... [
              Text(
                'Correo o contraseña incorrectos, intente de nuevo',
                style: TextStyle(color: Colors.red[400]),
              ),
              Boton(),
            ],
          ],
        );
      }
    );
  }
}

class Boton extends StatelessWidget{
  const Boton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child:TextButton(
        onPressed: () {
          final stateManager = getIt<LoginController>();
          stateManager.comprobarLogin(context);
        },
        child: Text('Iniciar Sesion'),
      ),
    );
    
  }
}

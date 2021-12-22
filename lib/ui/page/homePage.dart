import 'package:caase_app/ui/page/asistence_page.dart';
import 'package:caase_app/ui/page/asistencechek.dart';
import 'package:caase_app/ui/page/creategroup.dart';
import 'package:caase_app/ui/page/groups_page.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';

class HomePage extends StatelessWidget {
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('CaaseApp',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center),
        centerTitle: true,
        elevation: 5,
        leading: Icon(
          Icons.logout,
          color: Colors.blue[900],
        ),
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/mision.png')),
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(30),
                    fixedSize: Size(400, 100),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroup(),
                        ));
                  },
                  child: Text('Crear Grupo de Trabajo')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(400, 100),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupsList(),
                        ));
                  },
                  child: Text('Ver Grupos de Trabajo')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(400, 100),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AsistenceCheck(),
                        ));
                  },
                  child: Text('Registro de Asistencia a Sesiones')),
              TextButton(
                  onPressed: () {
                    service.signOut(context);
                  },
                  child: Text('Salir')),
            ],
          ),
        ),
      ),
    );
  }
}

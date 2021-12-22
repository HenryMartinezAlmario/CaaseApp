import 'package:caase_app/ui/page/groups_page.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';

class SesionsList extends StatelessWidget {
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
          Icons.auto_awesome_motion_rounded,
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
                'Consulta de Asistencias',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Crear Grupo de Trabajo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Ver Grupos de Trabajo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Registrar Asistencia a Sesión',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text('Home')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupsList(),
                        ));
                  },
                  child: Text('Lista de Grupos')),
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

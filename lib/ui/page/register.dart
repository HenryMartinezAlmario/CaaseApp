import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';

import 'loginPage.dart';

class register extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                'Pagina de Registro',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: 'Ingrese su Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                ),
                onPressed: () {
                  if (emailcontroller.text.isNotEmpty &&
                      passwordcontroller.text.isNotEmpty) {
                    service.CreateUser(
                        context, emailcontroller.text, passwordcontroller.text);
                  } else {
                    service.errorbox(
                        context, 'Los campos no pueden estar vacios');
                  }
                },
                child: Text('Registrarse'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  child: Text('Tengo una cuenta')),
            ],
          ),
        ),
      ),
    );
  }
}

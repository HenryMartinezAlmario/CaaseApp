import 'package:flutter/material.dart';
import 'package:caase_app/ui/page/register.dart';
import 'package:caase_app/controller/servicios.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
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
                'Resetear Password',
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
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                ),
                onPressed: () {
                  if (emailcontroller.text.isNotEmpty) {
                    service.resetPassword(context, emailcontroller.text);
                  } else {
                    service.errorbox(
                        context, 'Los campos no pueden estar vacios');
                  }
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

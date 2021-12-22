import 'package:caase_app/model/group_model.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:caase_app/controller/servicios.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);
  final groups = Groups();

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  Service service = Service();
  ScrollController scrollController = ScrollController();
  TextEditingController groupController = TextEditingController();
  TextEditingController t1Controller = TextEditingController();
  TextEditingController t2Controller = TextEditingController();

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
                'Crear Grupo de Trabajo',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: groupController,
                  decoration: InputDecoration(
                      hintText: 'Id Grupo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: t1Controller,
                  decoration: InputDecoration(
                      hintText: 'Tripulante #1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: t2Controller,
                  decoration: InputDecoration(
                      hintText: 'Tripulante #2',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  sendGroup(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Text('Crear Grupo'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.pink[700],
                  side: BorderSide(color: Colors.pink, width: 3.0),
                  padding: EdgeInsets.all(10.0),
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
                    service.signOut(context);
                  },
                  child: Text('Salir')),
            ],
          ),
        ),
      ),
    );
  }

  void sendGroup(context) {
    if (canSendGroup()) {
      final group = Group(
        groupController.text,
        t1Controller.text,
        t2Controller.text,
      );

      widget.groups.saveGroup(group);
      groupController.clear();
      t1Controller.clear();
      t2Controller.clear();
      setState(() {});
    }
  }

  bool canSendGroup() =>
      groupController.text.length > 0 &&
      t1Controller.text.length > 0 &&
      t2Controller.text.length > 0;
}

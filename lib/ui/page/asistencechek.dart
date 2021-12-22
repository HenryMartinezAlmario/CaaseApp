import 'package:caase_app/model/asistence_model.dart';
import 'package:caase_app/model/group_model.dart';
import 'package:caase_app/ui/page/asistence_page.dart';
import 'package:caase_app/ui/page/groups_page.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';
import 'package:get/get.dart';

class AsistenceCheck extends StatelessWidget {
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
        body: SesionWidget());
  }
}

class SesionWidget extends StatefulWidget {
  final asistences = Asistences();
  SesionWidget({Key? key}) : super(key: key);

  @override
  _SesionWidgetState createState() => _SesionWidgetState();
}

class _SesionWidgetState extends State<SesionWidget> {
  List<Group> groupsList = [];
  List<String> dataList = [];

  Object? get groupList => null;

  @override
  void initState() {
    final databaseRef = FirebaseDatabase.instance.reference().child("groups");

    List<String> getGroups() {
      List<String> este = ['Vainas bobas'];
      databaseRef.once().then((DataSnapshot snapshot) {
        List<String> groupList = [];
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          if (!groupList.contains(values["groupId"])) {
            groupList.add(values["groupId"]);
          }
        });
        dataList = groupList;
        este = groupList;
        print('Retur Interno');
        print(groupList);
        print('Retur Interno');
        return groupList;
      });
      print('Return externo');
      print(dataList);
      print('Return externo');
      return dataList;
    }

    getGroups();

    groupIds = [
      '1263-1',
      '1263-2',
      '1263-3',
      '1263-4',
      '1263-5',
      '1263-6',
      '1263-7',
      '1263-8',
      '1263-9',
      '1263-10'
    ];
    setState(() {
      _selectedGroupId = groupIds[0];
    });
    super.initState();
  }

  late List<String> groupIds = [];
  late String _selectedGroupId = 'grupo1';
  bool student1 = false;
  bool student2 = false;
  String groupId_text = '';
  String t1_text = 'false';
  String t2_text = 'false';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedGroupId,
            items: groupIds.map((String val) {
              return DropdownMenuItem<String>(
                key: ValueKey(val),
                value: val,
                child: Text(val),
              );
            }).toList(),
            hint: const Text("Por favor seleccionar un grupo"),
            onChanged: (value) {
              setState(() {
                _selectedGroupId = value!;
              });
              groupId_text = _selectedGroupId.toString();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Tripulante 1'),
              Switch(
                key: const ValueKey("sesionUser1"),
                value: student1,
                onChanged: (value) {
                  setState(() {
                    student1 = value;
                  });
                  t1_text = student1.toString();
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Tripulante 2'),
              Switch(
                key: const ValueKey("sesionUser2"),
                value: student2,
                onChanged: (value) {
                  setState(() {
                    student2 = value;
                  });
                  t2_text = student2.toString();
                },
              )
            ],
          ),
          OutlinedButton(
            onPressed: () {
              sendAsistence(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AsistencesList(),
                    //llevar a pagina ResetPassword
                  ));
            },
            child: Text('Registrar Asistencia'),
            style: OutlinedButton.styleFrom(
              primary: Colors.pink[700],
              side: BorderSide(color: Colors.pink, width: 3.0),
              padding: EdgeInsets.all(10.0),
            ),
          ),
        ],
      ),
    );
  }

  void sendAsistence(context) {
    if (true) {
      //canSendAsistence()
      final asistence =
          Asistence(groupId_text, t1_text, t2_text, DateTime.now());

      widget.asistences.saveAsistence(asistence);
      setState(() {});
    }
  }
}

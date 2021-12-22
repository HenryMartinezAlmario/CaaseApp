import 'package:caase_app/model/asistence_model.dart';
import 'package:caase_app/model/group_model.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AsistencesList extends StatefulWidget {
  final asistences = Asistences();
  AsistencesList({Key? key}) : super(key: key);

  @override
  State<AsistencesList> createState() => _AsistencesListState();
}

class _AsistencesListState extends State<AsistencesList> {
  Service service = Service();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => scrollDown());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('CaaseApp',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center),
        centerTitle: true,
        elevation: 5,
        leading: Icon(
          Icons.auto_awesome_motion_rounded,
          color: Colors.blue[900],
        ),
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            getAsistenceList(),
            TextButton(
                onPressed: () {
                  service.signOut(context);
                },
                child: Text('Salir')),
          ],
        ),
      ),
    );
  }

  Widget getAsistenceList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: scrollController,
        query: widget.asistences.getAsistences(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final asistence = Asistence.fromJson(json);
          return AsistenceWidget(asistence.groupId, asistence.t1, asistence.t2,
              asistence.sesion.toString()); //Cambiar el Widget
        },
      ),
    );
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
}

class AsistenceWidget extends StatelessWidget {
  late final String groupId_text;
  late final String t1_text;
  late final String t2_text;
  late final String sesion_text;

  AsistenceWidget(
      this.groupId_text, this.t1_text, this.t2_text, this.sesion_text);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const ValueKey("sesionCard"),
      elevation: 2,
      child: ListTile(
        leading: Icon(
          Icons.access_time_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          groupId_text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          sesion_text,
          textAlign: TextAlign.center,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(t1_text.toString()),
            Text(t2_text.toString()),
          ],
        ),
      ),
    );
  }
}

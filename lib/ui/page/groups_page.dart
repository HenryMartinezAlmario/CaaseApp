import 'package:caase_app/model/group_model.dart';
import 'package:caase_app/ui/page/homePage.dart';
import 'package:caase_app/ui/page/loginPage.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:caase_app/controller/servicios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupsList extends StatefulWidget {
  final groups = Groups();
  GroupsList({Key? key}) : super(key: key);

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
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
            getGroupList(),
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

  Widget getGroupList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: scrollController,
        query: widget.groups.getGroups(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final group = Group.fromJson(json);
          return GroupWidget(group.groupId, group.t1, group.t2);
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

class GroupWidget extends StatelessWidget {
  late final String groupId_text;
  late final String t1_text;
  late final String t2_text;

  GroupWidget(this.groupId_text, this.t1_text, this.t2_text);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(
            Icons.group_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            groupId_text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(t1_text), Text(t2_text)]),
        ),
      ),
    );
  }
}

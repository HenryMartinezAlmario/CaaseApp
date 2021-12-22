import 'package:firebase_database/firebase_database.dart';

class Group {
  late final String groupId;
  late final String t1;
  late final String t2;

  Group(this.groupId, this.t1, this.t2);

  Group.fromJson(Map<dynamic, dynamic> json)
      : groupId = json['groupId'] as String,
        t1 = json['t1'] as String,
        t2 = json['t2'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'groupId': groupId,
        't1': t1,
        't2': t2,
      };
}

class Groups {
  final DatabaseReference groupRef =
      FirebaseDatabase.instance.reference().child('groups');
  static var _groups = <Group>[];

  void saveGroup(Group group) {
    groupRef.push().set(group.toJson());
  }

  Query getGroups() => groupRef;

  List<Group> get groups => _groups;

  static List<String> groupIds() {
    List<String> list = [];
    for (var element in _groups) {
      list.add('Grupo ' + element.groupId.toString());
    }
    return list;
  }
}

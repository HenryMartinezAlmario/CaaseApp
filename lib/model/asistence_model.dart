import 'package:firebase_database/firebase_database.dart';

class Asistence {
  late final String groupId;
  late final String t1;
  late final String t2;
  late final DateTime sesion;

  Asistence(this.groupId, this.t1, this.t2, this.sesion);

  Asistence.fromJson(Map<dynamic, dynamic> json)
      : groupId = json['groupId'] as String,
        t1 = json['t1'] as String,
        t2 = json['t2'] as String,
        sesion = DateTime.parse(json['sesion'] as String);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'groupId': groupId,
        't1': t1,
        't2': t2,
        'sesion': sesion.toString()
      };
}

class Asistences {
  final DatabaseReference asistenceRef =
      FirebaseDatabase.instance.reference().child('asistences');

  void saveAsistence(Asistence asistence) {
    asistenceRef.push().set(asistence.toJson());
  }

  Query getAsistences() => asistenceRef;
}

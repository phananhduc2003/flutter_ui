import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";

//CREATE
class DatabaseMethods {
  Future addStudentDetails(
      Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Student")
        .doc(id)
        .set(studentInfoMap);
  }

//READ
  Future<Stream<QuerySnapshot>> getStudentDetails() async {
    return await FirebaseFirestore.instance.collection("Student").snapshots();
  }

//UPDATE
  Future updateStudentDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Student")
        .doc(id)
        .update(updateInfo);
  }

//DELETE
  Future deleteStudentDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Student")
        .doc(id)
        .delete();
  }
}

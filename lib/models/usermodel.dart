import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? password;
  final String? id;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.id
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      email: data?['email'],
      password: data?['password'],
      id: data?['id']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (id != null) "id": id
    };
  }
}



import 'package:flutter/material.dart';

class Users {
  late String id;
  late String displayName;
  late String email;

  Users({required this.id, required this.displayName, required this.email});

  Users.fromJson(Map<String, dynamic>? json) {
    id:
    json!['id'];
    displayName:
    json['displayName'];
    email:
    json['email'];
  }

  Map<String, dynamic>? toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['email'] = this.email;

    return data;
  }
}

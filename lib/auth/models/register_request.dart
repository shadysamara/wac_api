import 'dart:convert';

import 'package:flutter/material.dart';

class RegisterRequest {
  String firstname;
  String lastname;
  String email;
  String password;
  String password_confirmation;
  String username;
  int ref_by;
  String mobile;
  int agree;
  RegisterRequest({
    @required this.firstname,
    @required this.lastname,
    @required this.email,
    @required this.password,
    @required this.password_confirmation,
    @required this.username,
    @required this.ref_by,
    @required this.mobile,
    @required this.agree,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'username': username,
      'ref_by': ref_by,
      'mobile': mobile,
      'agree': agree,
    };
  }
}

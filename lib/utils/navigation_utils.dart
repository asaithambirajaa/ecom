import 'package:cart_app/view/login_view.dart';
import 'package:flutter/material.dart';

void openDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginView()),
  );
}

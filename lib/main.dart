// ignore_for_file: use_key_in_widget_constructors

import 'package:fcontact_app/ui/contact_list/contact_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Save Contact',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ContactListScreen(),
    );
  }
}

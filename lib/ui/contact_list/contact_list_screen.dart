// ignore_for_file: use_key_in_widget_constructors

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          var faker = Faker();
          return Center(
            child: Text(
              '${faker.person.firstName()} ${faker.person.firstName()}',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          );
        },
      ),
    );
  }
}

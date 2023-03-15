// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:faker/faker.dart';
import 'package:fcontact_app/data/contact.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  late final List<Contact> _contact;
  @override
  void initState() {
    super.initState();
    _contact = List.generate(50, (index) {
      return Contact(
        name: '${faker.person.firstName()} ${faker.person.firstName()}',
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
        email: faker.internet.freeEmail(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: _contact.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ListTile(
              title: Text(
                _contact[index].name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade600,
                ),
              ),
              subtitle: Text(
                _contact[index].email,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _contact[index].isFavorite = !_contact[index].isFavorite;
                  });
                },
                icon: Icon(
                  _contact[index].isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: _contact[index].isFavorite
                      ? Colors.red.shade300
                      : Colors.blueGrey.shade400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:fcontact_app/ui/contact_list/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactListScreen extends StatefulWidget {
  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  // late final List<Contact> _contact;
  // @override
  // void initState() {
  //   super.initState();
  //   _contact = List.generate(50, (index) {
  //     return Contact(
  //       name: '${faker.person.firstName()} ${faker.person.firstName()}',
  //       phoneNumber: faker.randomGenerator.integer(1000000).toString(),
  //       email: faker.internet.freeEmail(),
  //     );
  //   });
  // }

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
      body: ScopedModelDescendant<ContactsModel>(
        builder: ((context, child, model) {
          return ListView.builder(
              itemCount: model.contact.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ListTile(
                    title: Text(
                      model.contact[index].name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade600,
                      ),
                    ),
                    subtitle: Text(
                      model.contact[index].email,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        model.changeFavoriteStatus(index);
                      },
                      icon: Icon(
                        model.contact[index].isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: model.contact[index].isFavorite
                            ? Colors.red.shade300
                            : Colors.blueGrey.shade400,
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}

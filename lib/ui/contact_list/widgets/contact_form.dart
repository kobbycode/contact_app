// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formkey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: TextFormField(
              onSaved: (value) => _name = value!,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outlined),
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              onSaved: (value) => _email = value!,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: TextFormField(
              onSaved: (value) => _phoneNumber = value!,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone_outlined),
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    _formkey.currentState?.save();
                    // ignore: avoid_print
                    print('$_name $_email $_phoneNumber');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'SAVE CONTACT',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.person_outline,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

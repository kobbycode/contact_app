// ignore_for_file: use_key_in_widget_constructors

import 'package:fcontact_app/data/contact.dart';
import 'package:fcontact_app/ui/contact_list/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formkey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _phoneNumber = '';

// Validation for Name
  String? _validateName(value) {
    if (value.isEmpty) {
      return 'Enter Name';
    }
    return null;
  }

  // Validation for Email
  String? _validateEmail(value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'Enter Email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Invalid Email ';
    }
    return null;
  }

  // Validation for phone number
  String? _validatePhoneNumber(value) {
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    if (value.isEmpty) {
      return 'Enter Phone Number';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number ';
    }
    return null;
  }

  // Function to save contact on onPressed
  void _saveContactOnOnpressed() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState?.save();
      final newContact = Contact(
        name: _name,
        phoneNumber: _phoneNumber,
        email: _email,
      );
      ScopedModel.of<ContactsModel>(context).addContact(newContact);
    }
  }

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
              validator: _validateName,
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
              validator: _validateEmail,
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
              validator: _validatePhoneNumber,
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
                    _saveContactOnOnpressed();
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

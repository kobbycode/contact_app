import 'package:fcontact_app/ui/contact_list/widgets/contact_form.dart';
import 'package:flutter/material.dart';

class CreateContactPage extends StatelessWidget {
  const CreateContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Create Contact',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ContactForm(),
    );
  }
}

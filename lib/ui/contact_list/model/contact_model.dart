import 'package:faker/faker.dart';
import 'package:fcontact_app/data/contact.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactsModel extends Model {
  final List<Contact> _contact = List.generate(50, (index) {
    return Contact(
      name: '${faker.person.firstName()} ${faker.person.firstName()}',
      phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      email: faker.internet.freeEmail(),
    );
  });

  List<Contact> get contact => _contact;

  void changeFavoriteStatus(int index) {
    _contact[index].isFavorite = !_contact[index].isFavorite;
    sortContacts();
    notifyListeners();
  }

  void sortContacts() {
    _contact.sort((a, b) {
      int comparisonResult;
      comparisonResult = compareBaseOnFavoriteStatus(a, b);
      if (comparisonResult == 0) {
        comparisonResult = compareAlphabetically(a, b);
      }

      return comparisonResult;
    });
  }

  int compareBaseOnFavoriteStatus(Contact a, Contact b) {
    if (a.isFavorite) {
      // This makes sure the favorite contact is before the unfavorite
      return -1;
    } else if (b.isFavorite) {
      return 1;
    } else {
      return 0;
    }
  }

  int compareAlphabetically(Contact a, Contact b) {
    return a.name.compareTo(b.name);
  }
}

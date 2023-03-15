class Contact {
  String name;
  String phoneNumber;
  String email;
  bool isFavorite;
  Contact({
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.isFavorite = false,
  });
}

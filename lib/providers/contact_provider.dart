import 'package:flutter/cupertino.dart';

class Contact {
  final String name;
  final String numberPhone;

  Contact({required String this.name, required String this.numberPhone});

}
class ContactProvider extends ChangeNotifier{
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;
  void add(Contact contact){
    _contacts.add(contact);
    notifyListeners();
  }
}
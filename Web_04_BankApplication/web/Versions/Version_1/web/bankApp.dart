import 'dart:html';
import '../lib/bank_terminal.dart';

void main() {
  ButtonElement btn_create = querySelector('#btn_create');
  btn_create.onClick.listen(create_account);
}

create_account(Event e) {
  window.alert("Bank Account Created!...");
}


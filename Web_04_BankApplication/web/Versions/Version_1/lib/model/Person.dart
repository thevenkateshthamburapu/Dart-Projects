part of bank_terminal;

class Person {
  // Person properties and methods
  String name;
  String address;
  String email;
  String gender;
  DateTime date_birth;
  //Display user data
  String toString() => 'Person : $name\nAddress : $address \nemail : $email \ngender : $gender \ndate_birth : $date_birth';
}


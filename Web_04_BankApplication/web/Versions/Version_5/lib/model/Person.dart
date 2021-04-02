part of bank_terminal;

class Person {
  // Person properties and methods
  String _name;
  String address;
  String _email;
  String _gender;
  DateTime _date_birth;
//getters and setters
  String get name => _name;
  set name(value) {
    if (value != null && !value.isEmpty) _name = value;
  }

  String get email => _email;
  set email(value) {
    if (value != null && !value.isEmpty) _email = value;
  }

  String get gender => _gender;
  set gender(value) {
    if (value == 'M' || value == 'F') _gender = value;
  }

  DateTime get date_birth =>  _date_birth;
  set date_birth(value) {
    DateTime now = new DateTime.now();
    if (value.isBefore(now)) _date_birth = value;
  }

  // constructors:
  Person(name, this.address, email, gender, date_birth) {
    this.name = name;
    this.email = email;
    this.gender = gender;
    this.date_birth = date_birth;
  }

  Person.fromJson(Map json) {
    this.name = json["name"];
    this.address = json["address"];
    this.email = json["email"];
    this.gender = json["gender"];
    this.date_birth = DateTime.parse(json["birthdate"]);
  }
  //JSON conversion
  Map<String, Object> toJson() {
    Map<String, Object> per = new Map<String, Object>();
    per["name"] = name;
    per["address"] = address;
    per["email"] = email;
    per["gender"] = gender;
    per["birthdate"] = date_birth.toString();
    return per;
  }

  //Display user data
  String toString() => 'Person : $name\nAddress : $address \nemail : $email \ngender : $gender \ndate_birth : $date_birth';
}


class User {
  String email,
      phone,
      password,
      uuid,
      firstname,
      lastname,
      country,
      state,
      city;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      email = jsonMap['email'];
      phone = jsonMap['phoneNumber'];
      uuid = jsonMap['id'].toString();
      firstname = jsonMap['firstname'];
      lastname = jsonMap['lastname'];
      state = jsonMap['state'];
      country = jsonMap['country'];
      city = jsonMap['city'];
      password = jsonMap['password'];
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["email"] = email;
    map["password"] = password;
    map["phoneNumber"] = phone;
    map["id"] = uuid.toString();
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["city"] = city;
    map["country"] = country;
    map["state"] = state;

    return map;
  }

  Map loginCredentials() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;
    return map;
  }

  @override
  String toString() {
    var map = this.toMap();
    // map["auth"] = this.auth;
    return map.toString();
  }
}

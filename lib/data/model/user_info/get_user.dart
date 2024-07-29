class GetUserModel {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  String birthDate;
  String image;
  String bloodGroup;
  double height;
  double weight;
  String eyeColor;
  Hair? hair;
  String ip;
  Address? address;
  String macAddress;
  String university;
  Bank? bank;
  Company? company;
  String ein;
  String ssn;
  String userAgent;
  Crypto? crypto;
  String role;
  String errorMessage;

  GetUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
    required this.errorMessage,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
        id: json["id"] ?? 0,
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        maidenName: json["maidenName"] ?? '',
        age: json["age"] ?? 0,
        gender: json["gender"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        username: json["username"] ?? '',
        password: json["password"] ?? '',
        birthDate: json["birthDate"] ?? '',
        image: json["image"] ?? '',
        bloodGroup: json["bloodGroup"] ?? '',
        height: json["height"]?.toDouble() ?? 0.0,
        weight: json["weight"]?.toDouble() ?? 0.0,
        eyeColor: json["eyeColor"] ?? '',
        hair: json["hair"] == null ? null : Hair.fromJson(json["hair"]),
        ip: json["ip"] ?? '',
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        macAddress: json["macAddress"] ?? '',
        university: json["university"] ?? '',
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        ein: json["ein"] ?? '',
        ssn: json["ssn"] ?? '',
        userAgent: json["userAgent"] ?? '',
        crypto: json["crypto"] == null ? null : Crypto.fromJson(json["crypto"]),
        role: json["role"] ?? '',
        errorMessage: json["errorMessage"]??'',
      );
}

class Address {
  String address;
  String city;
  String state;
  String stateCode;
  String postalCode;
  Coordinates coordinates;
  String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        state: json["state"],
        stateCode: json["stateCode"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "state": state,
        "stateCode": stateCode,
        "postalCode": postalCode,
        "coordinates": coordinates.toJson(),
        "country": country,
      };
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"],
      );

  Map<String, dynamic> toJson() => {
        "cardExpire": cardExpire,
        "cardNumber": cardNumber,
        "cardType": cardType,
        "currency": currency,
        "iban": iban,
      };
}

class Company {
  String department;
  String name;
  String title;
  Address address;

  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "department": department,
        "name": name,
        "title": title,
        "address": address.toJson(),
      };
}

class Crypto {
  String coin;
  String wallet;
  String network;

  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        wallet: json["wallet"],
        network: json["network"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "wallet": wallet,
        "network": network,
      };
}

class Hair {
  String color;
  String type;

  Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json["color"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "type": type,
      };
}

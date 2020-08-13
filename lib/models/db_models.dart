class Person {
  int id;
  String firstname;
  String midname;
  String lastname;
  int age;
  int sex;
  Person(
      {this.id,
      this.firstname,
      this.midname,
      this.lastname,
      this.age,
      this.sex});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'midname': midname,
      'lastname': lastname,
      'age': age,
      'sex': sex
    };
    return map;
  }

  Person.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstname = map['firstname'];
    midname = map['midname'];
    lastname = map['lastname'];
    age = map['age'];
    sex = map['sex'];
  }
}

class Invest {
  int id;
  String date;
  String perDate;
  String endDate;
  num amount;
  num received;
  String status;
  num interest;
  String code;
  String type;
  String currency;
  String country;
  num totalyield;

  Invest(
      {this.id,
      this.date,
      this.perDate,
      this.amount,
      this.endDate,
      this.received,
      this.code,
      this.type,
      this.status,
      this.currency,
      this.country,
      this.interest,
      this.totalyield});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'date': date,
      'perDate': perDate,
      'amount': amount,
      'endDate': endDate,
      'received': received,
      'code': code,
      'type': type,
      'status': status,
      'interest': interest,
      'currency': currency,
      'country': country,
      'totalyield': totalyield
    };
    return map;
  }

  Invest.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];
    perDate = map['perDate'];
    amount = map['amount'];
    endDate = map['endDate'];
    received = map['received'];
    code = map['code'];
    type = map['type'];
    status = map['status'];
    interest = map['interest'];
    currency = map['currency'];
    country = map['country'];
    totalyield = map['totalyield'];
  }
}

class Asset {
  int id;
  String date;
  num asset;
  num debt;
  Asset({this.id, this.date, this.asset, this.debt});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'date': date,
      'asset': asset,
      'debt': debt,
    };
    return map;
  }

  Asset.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    date = map['date'];
    asset = map['asset'];
    debt = map['debt'];
  }
}

class Bill {
  int id;
  String date;
  String currency;
  String use;
  String amount;
  bool mark;
  Bill({this.id, this.date, this.currency, this.amount, this.use, this.mark});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'date': date,
      'currency': currency,
      'mark': mark,
      'use': use,
      'amount': amount
    };
    return map;
  }
}

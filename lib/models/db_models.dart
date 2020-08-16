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
  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    midname = json['midname'];
    lastname = json['lastname'];
    age = json['age'];
    sex = json['sex'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['firstname'] = this.firstname;
    map['midname'] = this.midname;
    map['lastname'] = this.lastname;
    map['age'] = this.age;
    map['sex'] = this.sex;
    return map;
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
  Invest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    perDate = json['perDate'];
    amount = json['amount'];
    endDate = json['endDate'];
    received = json['received'];
    code = json['code'];
    type = json['type'];
    status = json['status'];
    interest = json['interest'];
    currency = json['currency'];
    country = json['country'];
    totalyield = json['totalyield'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['perDate'] = this.perDate;
    map['amount'] = this.amount;
    map['endDate'] = this.endDate;
    map['received'] = this.received;
    map['code'] = this.code;
    map['type'] = this.type;
    map['status'] = this.status;
    map['interest'] = this.interest;
    map['currency'] = this.currency;
    map['country'] = this.country;
    map['totalyield'] = this.totalyield;
    return map;
  }
}

class Asset {
  int id;
  String date;
  num asset;
  num debt;
  Asset({this.id, this.date, this.asset, this.debt});
  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    asset = json['asset'];
    debt = json['debt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['asset'] = this.asset;
    map['debt'] = this.debt;
    return map;
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
  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    currency = json['currency'];
    use = json['use'];
    amount = json['amount'];
    mark = json['mark'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['currency'] = this.currency;
    map['use'] = this.use;
    map['amount'] = this.amount;
    map['mark'] = this.mark;
    return map;
  }
}

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

class Settings {
  int id;
  String currency;
  String language;

  Settings({this.id, this.currency, this.language});
  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    language = json['language'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['currency'] = this.currency;
    map['language'] = this.language;
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

class Invest1 {
  int id;
  String code;
  String date;
  num amount;
  String country;
  String originator;
  String brand;
  String currency;
  num term;
  String type;

  Invest1({
    this.id,
    this.date,
    this.code,
    this.amount,
    this.country,
    this.originator,
    this.brand,
    this.currency,
    this.term,
    this.type,
  });
  Invest1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    code = json['code'];
    amount = json['amount'];
    country = json['country'];
    originator = json['originator'];
    brand = json['brand'];
    currency = json['currency'];
    term = json['term'];
    type = json['type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['code'] = this.code;
    map['amount'] = this.amount;
    map['country'] = this.country;
    map['originator'] = this.originator;
    map['brand'] = this.brand;
    map['currency'] = this.currency;
    map['term'] = this.term;
    map['type'] = this.type;
    return map;
  }
}

class InvestDetail {
  int id;
  String investcode;
  num number;
  num days;
  String perdate;
  String finaldate;
  num rate;
  String status;
  num received;
  num interest;

  InvestDetail({
    this.id,
    this.number,
    this.investcode,
    this.days,
    this.perdate,
    this.finaldate,
    this.rate,
    this.status,
    this.received,
    this.interest,
  });
  InvestDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    investcode = json['investcode'];
    days = json['days'];
    perdate = json['perdate'];
    finaldate = json['finaldate'];
    rate = json['rate'];
    status = json['status'];
    received = json['received'];
    interest = json['interest'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['number'] = this.number;
    map['investcode'] = this.investcode;
    map['days'] = this.days;
    map['perdate'] = this.perdate;
    map['finaldate'] = this.finaldate;
    map['rate'] = this.rate;
    map['status'] = this.status;
    map['received'] = this.received;
    map['interest'] = this.interest;
    return map;
  }
}

class Asset {
  int id;
  String date;
  num asset;
  num debt;
  String currency;
  Asset({this.id, this.date, this.asset, this.debt, this.currency});
  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    asset = json['asset'];
    debt = json['debt'];
    currency = json['currency'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['asset'] = this.asset;
    map['debt'] = this.debt;
    map['currency'] = this.currency;
    return map;
  }
}

class Bill {
  int id;
  String date;
  String currency;
  String use;
  String categroy;
  num amount;
  num mark;
  Bill(
      {this.id,
      this.date,
      this.currency,
      this.amount,
      this.use,
      this.mark,
      this.categroy});
  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    currency = json['currency'];
    use = json['use'];
    amount = json['amount'];
    mark = json['mark'];
    categroy = json['categroy'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['date'] = this.date;
    map['currency'] = this.currency;
    map['use'] = this.use;
    map['amount'] = this.amount;
    map['mark'] = this.mark;
    map['categroy'] = this.categroy;
    return map;
  }
}

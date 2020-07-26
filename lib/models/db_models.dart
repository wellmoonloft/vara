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
  String investtime;
  String pertime;
  String endtime;
  num investamount;
  num received;
  String status;
  String investcode;
  String investtype;
  String currency;

  Invest(
      this.id,
      this.investtime,
      this.pertime,
      this.investamount,
      this.endtime,
      this.received,
      this.investcode,
      this.investtype,
      this.status,
      this.currency);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'investtime': investtime,
      'pertime': pertime,
      'investamount': investamount,
      'endtime': endtime,
      'received': received,
      'investcode': investcode,
      'investtype': investtype,
      'status': status,
      'currency': currency
    };
    return map;
  }

  Invest.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    investtime = map['investtime'];
    pertime = map['pertime'];
    investamount = map['investamount'];
    endtime = map['endtime'];
    received = map['received'];
    investcode = map['investcode'];
    investtype = map['investtype'];
    status = map['status'];
    currency = map['currency'];
  }
}

class Asset {
  int id;
  String addtime;
  int assetamount;
  String currency;
  //Asset(this.id, this.addtime, this.assetamount, this.currency);
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'addtime': addtime,
      'assetamount': assetamount,
      'currency': currency,
    };
    return map;
  }

  // Asset.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   addtime = map['addtime'];
  //   assetamount = map['assetamount'];
  //   currency = map['currency'];
  // }
}

class IncomeDetail {
  int id;
  String addtime;
  int currency;
  String use;
  String detailamount;
  IncomeDetail(
      this.id, this.addtime, this.currency, this.detailamount, this.use);
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'addtime': addtime,
      'currency': currency,
      'use': use,
      'detailamount': detailamount
    };
    return map;
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vara/models/db_models.dart';

Database _db;

class DBHelper {
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'VaraDB', 'Vara.db');
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    debugPrint(path);
    return db;
  }

  _onCreate(Database db, int version) async {
    //Create Table in first time
    await db.execute(
        'CREATE TABLE person (id INTEGER PRIMARY KEY, firstname TEXT, midname TEXT, lastname TEXT, age INTEGER, sex INTEGER)');
    await db.execute(
        'CREATE TABLE invest (id INTEGER PRIMARY KEY, investtime TEXT, pertime TEXT, investamount INTEGER, endtime TEXT,  received INTEGER,investcode TEXT, investtype TEXT, status TEXT,currency TEXT)');
    await db.execute(
        'CREATE TABLE asset (id INTEGER PRIMARY KEY, date TEXT, asset INTEGER, debt INTEGER)');
    await db.execute(
        'CREATE TABLE incomedetail (id INTEGER PRIMARY KEY, addtime TEXT, currency INTEGER, use TEXT, detailamount TEXT)');

    //init data in first time
    Person person = Person();
    person.firstname = 'Anonymous';
    person.midname = '';
    person.lastname = 'Vara';
    person.age = 25;
    person.sex = 0;
    await db.insert('person', person.toMap());

    Asset asset = Asset();
    asset.date = new DateTime.now().toString();
    asset.asset = 0;
    asset.debt = 0;
    await db.insert('asset', asset.toMap());
  }

  Future<Person> add(Person person) async {
    var dbClient = await db;
    person.id = await dbClient.insert('person', person.toMap());
    return person;
  }

  Future<Invest> addData(Invest invest) async {
    var dbClient = await db;
    invest.id = await dbClient.insert('invest', invest.toMap());
    return invest;
  }

  Future<List<Person>> getPerson() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('person',
        columns: ['id', 'firstname', 'midname', 'lastname', 'age', 'sex']);
    List<Person> personList = [];
    for (int i = 0; i < maps.length; i++) {
      personList.add(Person.fromMap(maps[i]));
    }

    return personList;
  }

  Future<List<Map>> getAsset() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query('asset', columns: ['id', 'date', 'asset', 'debt']);

    return maps;
  }

  Future<List<Invest>> getInvest() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('invest', columns: [
      'id',
      'investtime',
      'pertime',
      'investamount',
      'endtime',
      'received',
      'investcode',
      'investtype',
      'status',
      'currency'
    ]);
    List<Invest> investList = [];
    for (int i = 0; i < maps.length; i++) {
      investList.add(Invest.fromMap(maps[i]));
    }

    return investList;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'person',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Person person) async {
    var dbClient = await db;
    return await dbClient.update(
      'person',
      person.toMap(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

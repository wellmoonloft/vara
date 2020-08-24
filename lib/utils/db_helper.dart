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
    } else {
      _db = await initDatabase();
      return _db;
    }
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
        'CREATE TABLE invest (id INTEGER PRIMARY KEY, date TEXT, perDate TEXT, amount INTEGER, endDate TEXT,  received INTEGER,code TEXT, type TEXT, status TEXT,interest INTEGER,currency TEXT,country TEXT,totalyield INTEGER)');
    await db.execute(
        'CREATE TABLE asset (id INTEGER PRIMARY KEY, date TEXT,currency TEXT, asset INTEGER, debt INTEGER)');
    await db.execute(
        'CREATE TABLE bill (id INTEGER PRIMARY KEY, date TEXT, currency TEXT, use TEXT, categroy TEXT,amount INTEGER, mark INTEGER)');
    await db.execute(
        'CREATE TABLE settings (id INTEGER PRIMARY KEY, currency TEXT,language TEXT)');

    Settings settings = Settings();
    settings.currency = 'EUR';
    settings.language = 'EN';
    db.insert('settings', settings.toJson());
  }

  Future<Settings> getSettings() async {
    var dbClient = await db;
    var result = await dbClient
        .query('settings', columns: ['id', 'currency', 'language']);
    Settings settings = Settings.fromJson(result.last);
    return settings;
  }

  Future<int> updateSettings(Settings settings) async {
    var dbClient = await db;
    var result = await dbClient
        .query('settings', columns: ['id', 'currency', 'language']);
    Settings temp = Settings.fromJson(result.last);
    if (settings.currency != null) {
      temp.currency = settings.currency;
    }
    if (settings.language != null) {
      temp.language = settings.language;
    }
    return await dbClient
        .update('settings', temp.toJson(), where: 'id=?', whereArgs: [temp.id]);
  }

  Future<List<Asset>> getAsset() async {
    var dbClient = await db;
    var result = await dbClient.query('asset',
        columns: ['id', 'date', 'asset', 'debt', 'currency'], orderBy: 'date');
    List<Asset> asset = [];
    result.forEach((element) => asset.add(Asset.fromJson(element)));
    return asset;
  }

  Future<int> updateAsset(Asset asset) async {
    var dbClient = await db;
    var result = await dbClient.query('asset',
        where: 'date=\'' +
            asset.date +
            '\' and currency=\'' +
            asset.currency +
            '\'');
    if (result.length > 0) {
      Asset temp = Asset.fromJson(result.last);
      asset.id = temp.id;
      asset.asset = temp.asset + asset.asset;
      asset.debt = temp.debt + asset.debt;
      asset.currency = temp.currency;
      return await dbClient.update('asset', asset.toJson(),
          where: 'id=?', whereArgs: [asset.id]);
    } else {
      return await dbClient.insert('asset', asset.toJson());
    }
  }

  Future<List<Invest>> getInvestList() async {
    var dbClient = await db;
    var result = await dbClient.query('invest',
        columns: [
          'id',
          'date',
          'perDate',
          'amount',
          'endDate',
          'received',
          'code',
          'type',
          'status',
          'interest',
          'currency',
          'country',
          'totalyield'
        ],
        orderBy: 'date');

    List<Invest> invest = [];
    result.forEach((element) => invest.add(Invest.fromJson(element)));
    return invest;
  }

  Future<int> updateInvest(Invest invest) async {
    var dbClient = await db;
    var result = await dbClient
        .query('invest', where: 'code=?', whereArgs: [invest.code]);
    if (result.length > 0) {
      Invest temp = Invest.fromJson(result.last);
      invest.id = temp.id;
      return await dbClient.update('invest', invest.toJson(),
          where: 'code=?', whereArgs: [invest.code]);
    } else {
      return await dbClient.insert('invest', invest.toJson());
    }
  }

  Future updateInvestandData(Invest invest) async {
    var dbClient = await db;
    var result = await dbClient
        .query('invest', where: 'code=?', whereArgs: [invest.code]);

    if (result.length > 0) {
      Invest temp = Invest.fromJson(result.last);
      if (temp.status != 'FINISHED') {
        if (invest.status == 'LATE') {
          invest.id = temp.id;
          await dbClient.update('invest', invest.toJson(),
              where: 'code=?', whereArgs: [invest.code]);
        } else if (invest.status == 'FINISHED') {
          Asset asset = new Asset();
          asset.debt = 0;
          asset.asset = invest.received - invest.amount;
          asset.asset = asset.asset - invest.amount;
          asset.date = invest.endDate;
          asset.date = invest.currency;
          await updateAsset(asset);

          invest.interest = invest.received - invest.amount;
          double temp = invest.interest / invest.amount;
          if (temp == 0) {
            invest.totalyield = 0;
          } else {
            var starttime = DateTime.parse(invest.date);
            var endDate = DateTime.parse(invest.endDate);
            var daydifree = endDate.difference(starttime);
            temp = temp / daydifree.inDays;
            invest.totalyield = temp * 365;
          }
          await dbClient.insert('invest', invest.toJson());
        }
      }
    } else {
      if (invest.status == 'FINISHED') {
        Asset asset = new Asset();
        asset.debt = 0;
        var starttime = DateTime.parse(invest.date);
        var endDate = DateTime.parse(invest.endDate);
        var daydifree = endDate.difference(starttime);

        asset.asset = invest.received - invest.amount;
        asset.date = invest.endDate;
        asset.currency = invest.currency;
        invest.interest = invest.received - invest.amount;
        double temp = invest.interest / invest.amount;
        if (temp == 0) {
          invest.totalyield = 0;
        } else {
          temp = temp / daydifree.inDays;
          invest.totalyield = temp * 365;
        }
        await dbClient.insert('invest', invest.toJson());
        await updateAsset(asset);
      } else {
        // InvestAccount investAccount = new InvestAccount();
        // investAccount.balance = invest.amount;
        // investAccount.date = invest.date;
        Asset asset = new Asset();
        asset.debt = 0;
        asset.asset = invest.amount;
        asset.date = invest.date;
        asset.currency = invest.currency;
        invest.interest = 0;
        invest.totalyield = 0;
        await dbClient.insert('invest', invest.toJson());
        await updateAsset(asset);
      }
    }
  }

  Future<int> deleteInvest(Invest invest) async {
    var dbClient = await db;
    return await dbClient.delete(
      'invest',
      where: 'code = ?',
      whereArgs: [invest.code],
    );
  }

  Future<List<Bill>> getBill() async {
    var dbClient = await db;
    var result = await dbClient.query('bill', columns: [
      'id',
      'date',
      'currency',
      'use',
      'amount',
      'mark',
      'categroy'
    ]);
    List<Bill> bill = [];
    result.forEach((element) => bill.add(Bill.fromJson(element)));
    return bill;
  }

  Future<int> updateBill(Bill bill) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query('bill', where: 'date=?', whereArgs: [bill.date]);
    if (maps.length > 0) {
      Map temp = maps.last;
      bill.id = temp['id'];
      // bill.asset = temp['asset'] + asset.asset;
      // bill.debt = temp['debt'] + asset.debt;
      return await dbClient.update('bill', bill.toJson(),
          where: 'date=?', whereArgs: [bill.date]);
    } else {
      return await dbClient.insert('bill', bill.toJson());
    }
  }

  Future<int> insertBill(Bill bill) async {
    var dbClient = await db;
    await dbClient.insert('bill', bill.toJson());
    Asset asset = new Asset();
    if (bill.mark == 0) {
      asset.debt = bill.amount;
      asset.asset = 0;
    } else {
      asset.asset = bill.amount;
      asset.debt = 0;
    }
    asset.date = bill.date;
    asset.currency = bill.currency;
    return await updateAsset(asset);
  }

  Future<int> deleteBill(Bill bill) async {
    var dbClient = await db;
    await dbClient.delete(
      'bill',
      where: 'id = ?',
      whereArgs: [bill.id],
    );
    Asset asset = new Asset();
    if (bill.mark == 0) {
      asset.debt = 0 - bill.amount;
      asset.asset = 0;
    } else {
      asset.asset = 0 - bill.amount;
      asset.debt = 0;
    }
    asset.date = bill.date;
    asset.currency = bill.currency;
    return await updateAsset(asset);
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
      person.toJson(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }

  Future<List<Person>> getPerson() async {
    var dbClient = await db;
    var result = await dbClient.query('asset',
        columns: ['id', 'firstname', 'midname', 'lastname', 'age', 'sex']);
    List<Person> person = [];
    result.forEach((element) => person.add(Person.fromJson(element)));
    return person;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

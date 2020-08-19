import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vara/models/db_models.dart';

import 'num_utils.dart';

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
        'CREATE TABLE invest (id INTEGER PRIMARY KEY, date TEXT, perDate TEXT, amount INTEGER, endDate TEXT,  received INTEGER,code TEXT, type TEXT, status TEXT,interest INTEGER,currency TEXT,country TEXT,totalyield INTEGER)');
    await db.execute(
        'CREATE TABLE asset (id INTEGER PRIMARY KEY, date TEXT, asset INTEGER, debt INTEGER)');
    await db.execute(
        'CREATE TABLE bill (id INTEGER PRIMARY KEY, date TEXT, currency TEXT, use TEXT,amount INTEGER, mark BOOLEAN)');
  }

  Future<List<Asset>> getAsset() async {
    var dbClient = await db;
    var result = await dbClient.query('asset',
        columns: ['id', 'date', 'asset', 'debt'], orderBy: 'date');
    List<Asset> asset = [];
    result.forEach((element) => asset.add(Asset.fromJson(element)));
    return asset;
  }

  Future<int> updateAsset(Asset asset) async {
    var dbClient = await db;
    var result =
        await dbClient.query('asset', where: 'date=?', whereArgs: [asset.date]);
    if (result.length > 0) {
      Asset temp = Asset.fromJson(result.last);
      asset.id = temp.id;
      asset.asset = temp.asset + asset.asset;
      asset.debt = temp.debt + asset.debt;
      return await dbClient.update('asset', asset.toJson(),
          where: 'date=?', whereArgs: [asset.date]);
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
          asset.asset = NumUtil.subtract(invest.received, invest.amount);
          asset.asset = NumUtil.subtract(asset.asset, invest.amount);
          asset.date = invest.endDate;
          await updateAsset(asset);

          invest.interest = NumUtil.subtract(invest.received, invest.amount);
          double temp = NumUtil.divide(invest.interest, invest.amount);
          if (temp == 0) {
            invest.totalyield = 0;
          } else {
            var starttime = DateTime.parse(invest.date);
            var endDate = DateTime.parse(invest.endDate);
            var daydifree = endDate.difference(starttime);
            temp = NumUtil.divide(temp, daydifree.inDays);
            invest.totalyield = NumUtil.multiply(temp, 365);
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

        asset.asset = NumUtil.subtract(invest.received, invest.amount);
        asset.date = invest.endDate;
        invest.interest = NumUtil.subtract(invest.received, invest.amount);
        double temp = NumUtil.divide(invest.interest, invest.amount);
        if (temp == 0) {
          invest.totalyield = 0;
        } else {
          temp = NumUtil.divide(temp, daydifree.inDays);
          invest.totalyield = NumUtil.multiply(temp, 365);
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

  Future<List<Map>> getBill() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('bill',
        columns: ['id', 'date', 'currency', 'use', 'amount', 'mark']);

    return maps;
  }

  Future<int> updateBill(Bill bill) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query('asset', where: 'date=?', whereArgs: [bill.date]);
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

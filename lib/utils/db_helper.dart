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
        'CREATE TABLE invest (id INTEGER PRIMARY KEY, date TEXT, perDate TEXT, amount INTEGER, endDate TEXT,  received INTEGER,code TEXT, type TEXT, status TEXT,interest INTEGER,currency TEXT,country TEXT,totalyield INTEGER)');
    await db.execute(
        'CREATE TABLE asset (id INTEGER PRIMARY KEY, date TEXT, asset INTEGER, debt INTEGER)');
    await db.execute(
        'CREATE TABLE bill (id INTEGER PRIMARY KEY, date TEXT, currency TEXT, use TEXT,amount INTEGER, mark BOOLEAN)');
  }

  Future<List<Map>> getAsset() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query('asset', columns: ['id', 'date', 'asset', 'debt']);

    return maps;
  }

  Future<int> updateAsset(Asset asset) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query('asset', where: 'date=?', whereArgs: [asset.date]);
    if (maps.length > 0) {
      Map temp = maps.last;
      asset.id = temp['id'];
      asset.asset = temp['asset'] + asset.asset;
      asset.debt = temp['debt'] + asset.debt;
      return await dbClient.update('asset', asset.toMap(),
          where: 'date=?', whereArgs: [asset.date]);
    } else {
      return await dbClient.insert('asset', asset.toMap());
    }
  }

  Future<List<Map>> getInvest() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('invest', columns: [
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
    ]);

    return maps;
  }

  Future<int> updateInvest(Invest invest) async {
    var dbClient = await db;
    List maps = await dbClient
        .query('invest', where: 'code=?', whereArgs: [invest.code]);
    if (maps.length > 0) {
      Map temp = maps.last;
      invest.id = temp['id'];
      return await dbClient.update('invest', invest.toMap(),
          where: 'code=?', whereArgs: [invest.code]);
    } else {
      return await dbClient.insert('invest', invest.toMap());
    }
  }

  Future<int> deleteInvest(String code) async {
    var dbClient = await db;
    return await dbClient.delete(
      'invest',
      where: 'code = ?',
      whereArgs: [code],
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
      return await dbClient.update('bill', bill.toMap(),
          where: 'date=?', whereArgs: [bill.date]);
    } else {
      return await dbClient.insert('bill', bill.toMap());
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

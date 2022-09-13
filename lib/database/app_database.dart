import 'dart:async';
import 'package:flutter_base/database/user/user.dart';
import 'package:flutter_base/database/user/user_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';
// create database
@Database(
    version: 1,
    entities: [User])

abstract class AppDatabase extends FloorDatabase {
   UserDAO get userDao;
}
import 'package:floor/floor.dart';
import 'package:flutter_base/database/app_database.dart';
import 'package:logger/logger.dart';

class DatabaseUtils {
  static AppDatabase? database;
  static Callback callback = Callback(
    onCreate: (database, version) {
      /* database has been created */
    },
    onOpen: (database) {
      /* database has been opened */
    },
    onUpgrade: (database, startVersion, endVersion) {
      /* database has been upgraded */
      Logger().d("DatabaseUtils", "startVersion ${startVersion}");
      Logger().d("DatabaseUtils", "endVersion ${endVersion}");
    },
  );

  // create migration
  static Migration migration = Migration(1, 2, (database) async {
    await database.execute('ALTER TABLE person ADD COLUMN nickname TEXT');
  });

  static databaseBuilder() async {
    database = await $FloorAppDatabase
        .databaseBuilder('base_database.db')
        .addCallback(callback)
        .build();
  }

  static AppDatabase? getDb() {
    // databaseBuilder();
    return database;
  }
}
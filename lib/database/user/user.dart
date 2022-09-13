import 'package:floor/floor.dart';
import 'package:flutter_base/database/base_object.dart';
// create table and model
@Entity(tableName: 'user')
class User {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'phone_number')
  final String phone;

  @ColumnInfo(name: 'your_mail')
  final String email;

  @ColumnInfo(name: 'pass_word')
  final String pass;

  User(this.email,this.phone, this.pass,this.id);
     // {int id, String createTime, String updateTime});
      //: super(id, updateTime, createTime: createTime);
}

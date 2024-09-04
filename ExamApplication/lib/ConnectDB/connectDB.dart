import 'dart:developer';

import 'package:examapp/ConnectDB/constantString.dart';
import 'package:examapp/ConnectDB/insertDB/register.dart';
import 'package:mongo_dart/mongo_dart.dart';

class connectMongoDb
{
static var db, accountCollection;
static connect() async {
  db = await Db.create(MONGO_CONN_URL);
  await db.open();
  inspect(db);
  accountCollection = db.collection(ACCOUNT_COLLECTION);
  print("connect successfully");
}

static Future<Map<String, dynamic>?> querryAccount(String email) async {
  await connect();
  var user = await accountCollection.findOne(where.eq('email', email));
  //await db.close();
  return user;
}

static Future<String> register(Register data) async {
  try{
    var res = await accountCollection.insertOne(data.toJson());
    if(res.isSuccess)
      {
        return "insert successfully";
      }
    else
      return "Error";
  }
  catch(e){
    print(e.toString());
    return e.toString();
  }
}
}
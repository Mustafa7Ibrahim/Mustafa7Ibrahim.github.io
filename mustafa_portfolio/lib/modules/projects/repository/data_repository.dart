import 'package:firebase_database/firebase_database.dart';
import 'package:mustafa_portfolio/core/core_data/my_data_model.dart';

/// DataRepository is a class that is used to get data from firebase.
class DataRepository {
  /// getData is a method that is used to get data from firebase.
  Future<Portfolio> getData() async {
    final ref = await FirebaseDatabase.instance.ref().get();
    final data = Portfolio.fromJson(ref.value! as Map<String, dynamic>);
    return data;
  }
}

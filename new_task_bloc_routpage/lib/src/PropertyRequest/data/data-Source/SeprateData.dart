import 'package:new_task_bloc_routpage/src/PropertyRequest/data/models/PropertyRequestmodel.dart';

class SatprateData {
  static List<PropertyCategory> categories = [
    PropertyCategory('Residential'),
    PropertyCategory('PG'),
    PropertyCategory('Villa'),
    PropertyCategory('Service Apartment'),
  ];

  static List<PropertyType> types = [
    PropertyType('1bhk'),
    PropertyType('2bhk'),
    PropertyType('3bhk'),
    PropertyType('4bhk'),
  ];

  static List<TransactionType> transactionTypes = [
    TransactionType('Rent'),
    TransactionType('Lease'),
    TransactionType('Buy'),
    TransactionType('Sell'),
  ];
}

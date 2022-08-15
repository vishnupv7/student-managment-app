import 'package:hive/hive.dart';
part 'data_model.g.dart';
@HiveType(typeId:1 )

class StudentModel{
  @HiveField(5)
  int? id;
 
  @HiveField(0)
  final String  name;
  @HiveField(1)
  final String  age;
  @HiveField(2)
  final String  phonenumber;
  @HiveField(3)
  final String  guardian;
  @HiveField(4)
  final String image;
  





  StudentModel( {required this.name, this.id, required this.image,  required this.age, required this.phonenumber, required this.guardian, });
  

}
class DataModel {
  String name;
  String motto;
  List<Map<String, dynamic>> accounts = [];
  String location;
  //String img;

  DataModel(
      {required this.name,
      required this.motto,
      required this.accounts,
      //required this.schoolFees,
      required this.location
      //required this.img
      });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        motto: json['motto'],
        //description: json['description'],
        accounts: json['accounts'],
        //img: json['img'],
        location: json['location']);
  }
}

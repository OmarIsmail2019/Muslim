class DoaaModel{
  int? id;
  String? name;

  DoaaModel({this.id, this.name});

  DoaaModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
  }
}